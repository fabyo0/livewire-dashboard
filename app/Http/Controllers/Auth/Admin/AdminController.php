<?php

namespace App\Http\Controllers\Auth\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Order;
use Asantibanez\LivewireCharts\Models\PieChartModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class AdminController extends Controller
{


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('adminAuth')->except('logout');

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
}
