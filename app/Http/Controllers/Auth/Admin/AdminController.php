<?php

namespace App\Http\Controllers\Auth\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Order;
use App\Models\Transaction;
use Asantibanez\LivewireCharts\Models\AreaChartModel;
use Asantibanez\LivewireCharts\Models\ColumnChartModel;
use Asantibanez\LivewireCharts\Models\LineChartModel;
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
        $date_from = '2024-11-01';
        $date_to = '2024-11-30';

//    get amount transaction paid per month
        $transactions = DB::table('transactions')
            ->whereBetween('created_at', [$date_from, $date_to])
            ->get();
        $totalNovember = $transactions->sum('amount_paid');


        $columnChartModel =
            (new PieChartModel())
                ->addSlice('Users', $countCustomers, '#f6ad55')
                ->addSlice('Orders', $countOrders, '#fc8181')
                ->addSlice('Products', $products, '#90cdf4');

        $lineChartModel =
            (new ColumnChartModel())
                ->setTitle('Profit month')
                ->addColumn('September', 132, '#fc8181', [
                    'tooltip' => '€' . price(132)
                ])->addColumn('October', 355, '#f6ad55', [
                    'tooltip' => '€' . price(355)
                ])->addColumn('November', $totalNovember, '#008f39', [
                    'tooltip' => '€' . price($totalNovember),
                ]);

        return view('auth.admin.dashboard', [
            'customers' => $customers,
            'products' => $products,
            'orders' => $orders,
            'notifications' => $notifications,
            'columnChartModel' => $columnChartModel,
            'lineChartModel' => $lineChartModel,
        ]);

    }
}
