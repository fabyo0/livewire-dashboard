<?php

namespace App\Http\Controllers\Auth\Admin;

use App\Http\Controllers\Controller;
use App\Mail\NewsletterMail;
use App\Models\Customer;
use App\Models\Newsletter;
use App\Models\User;
use App\Notifications\NewsletterPlacedNotification;
use App\Notifications\OrderPlacedNotification;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Validator;

class NewsletterController extends Controller
{
//    public function __construct()
//    {
//        $this->middleware('adminAuth');
//    }

    public function index()
    {
        if (auth()->guard('admin')->check()) {
            $subscribers = Newsletter::orderBy('created_at', 'DESC')->paginate(15);
            $currentNotice = \App\Models\Notification::where('read_at', '=', null)->first();

            if (!empty($currentNotice)) {
//                $currentNotice->read_at = Carbon::now();
//                $currentNotice->save();
                $currentNotice->delete();
            }
            return view('auth.admin.newsletter.index', ['subscribers' => $subscribers]);
        } else {
            return redirect()->route('index');
        }
    }

    public function store( Request $request)
    {
        $this->validate($request, [
            'emailSubscription' => ['required', 'string', 'email', 'max:255', 'unique:newsletters'],

        ]);
        $input = $request->all();
        $newsletterId = new Newsletter;
        $newsletterId->emailSubscription = \request()->input('emailSubscription');

        $newsletterId->update($input);
        $newsletterId->save();

        Mail::to($newsletterId->emailSubscription)->send(new NewsletterMail($newsletterId));
        $user = User::find(1);

        $details = [
            'greeting' => 'You have received a new newsletter subscription from Livewire Ecommerce Platform',
            'body' => 'Click on the button below to view members',
            'thanks' => 'Thank you!',
            'subject' => 'New Newsletter Subscription',
            'actionText' => 'RESTRICTED AREA.',
            'actionURL' => url(env('APP_URL') . env('APP_ADMIN_URL') ),
            'email_subscription' =>   $newsletterId->emailSubscription,
        ];
        Notification::send($user, new NewsletterPlacedNotification($details));

        return redirect()->back()->with('success', 'You have successfully subscribed to the newsletter!');
    }

    public function unsubscribe( $id)
    {

        $subscriber = Newsletter::where('id', $id)->first();
        $subscriber->delete();

    }

    public function destroy( $id)
    {
        if (auth()->guard('admin')->user()) {
            Newsletter::findOrFail($id)->delete();

            return redirect()->back()
                ->with('success', 'Iscritto deleted successfully');
        } else {
            abort(404);
        }
    }
}
