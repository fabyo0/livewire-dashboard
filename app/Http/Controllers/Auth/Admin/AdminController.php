<?php

namespace App\Http\Controllers\Auth\Admin;

use App\Events\AdminLoginHistory;
use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Notification;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use Asantibanez\LivewireCharts\Models\ColumnChartModel;
use Asantibanez\LivewireCharts\Models\PieChartModel;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;


class AdminController extends Controller
{
//    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
//    protected $redirectTo = '/admin/login';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');


    }

    public function logout(Request $request)
    {
        Auth::guard('admin')->logout();
        return redirect()->route('index');
    }

    public function adminLogout()
    {
        auth()->guard('admin')->logout();
        return redirect()->route('index')->with('success', 'Logged out successfully');
    }

    public function dashboard()
    {
//        if (auth()->guard('admin')->check()) {
        $notifications = DB::table('notifications')->orderBy('created_at', 'DESC')->get();
        $customers = Customer::all();
        $countCustomers = DB::table('customers')->count();
        $countOrders = DB::table('orders')->count();
        $products = DB::table('products')->count();
        $orders = Order::orderBy('created_at', 'DESC')->paginate(8);

        $columnChartModel =
            (new PieChartModel())
                ->addSlice('Users', $countCustomers, '#f6ad55')
                ->addSlice('Orders', $countOrders, '#fc8181')
                ->addSlice('Products', $products, '#90cdf4');

        return view('auth.admin.dashboard', [
            'customers' => $customers,
            'products' => $products,
            'orders' => $orders,
            'notifications' => $notifications,
            'columnChartModel' => $columnChartModel,
        ]);

    }

//    public function searchOrder()
//    {
//        if (auth()->guard('admin')->check()) {
//            $pagination = 6;
//            $notifications = DB::table('notifications')->orderBy('created_at', 'DESC')->get();
//            $customers = DB::table('customers')->orderBy('created_at', 'DESC')->get();
//            $products = DB::table('products')->count();
//
//            $o = trim(\request()->input('o'));
//
//            $query = \request()->all();
//            $orders = Order::query()->where('order_number', 'LIKE', '%' . $o . '%')
//                ->orWhere('billing_name', 'LIKE', '%' . $o . '%')
//                ->paginate($pagination);
//            $orders->appends(['search' => $o]);
//
//            if (count($orders) > 0) {
//                return view('auth.admin.dashboard')->withDetails($orders)->withQuery($o)->with([
//                    'o' => $o,
//                    'query' => $query,
//                    'products' => $products,
//                    'customers' => $customers,
//                    'notifications' => $notifications,
//                    'orders' => $orders,
//                ]);
//            } else {
//                return redirect()->back()->with('danger', 'Corrispondenza non trovata');
//            }
//        } else {
//            return redirect()->route('index');
//        }
//    }
}
