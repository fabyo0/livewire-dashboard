<div class="mt-8">
    <div class="flex flex-col mt-4">
        <div class="align-middle overflow-x-auto shadow sm:rounded-lg mb-4">
            <table class="min-w-full divide-y divide-gray-200">
                <thead>
                <tr>
                    <th wire:click.prevent="sortBy('order_number')" style="width:150px;cursor:pointer"
                        class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                        ID Order
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="{{ $sortColumnName === 'order_number' && $sortDirection === 'asc' ? 'black' : 'currentColor' }}"
                             class="w-3 h-3 inline-block">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M8.25 6.75L12 3m0 0l3.75 3.75M12 3v18"/>
                        </svg>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="{{ $sortColumnName === 'order_number' && $sortDirection === 'desc' ? 'black' : 'currentColor' }}"
                             class="w-3 h-3 inline-block">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M15.75 17.25L12 21m0 0l-3.75-3.75M12 21V3"/>
                        </svg>
                    </th>
                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Customer Details
                    </th>
                    <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Payment Method
                    </th>
                    <th wire:click.prevent="sortBy('grand_total')" style="width:150px;cursor:pointer"
                        class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                        Total
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="{{ $sortColumnName === 'grand_total' && $sortDirection === 'asc' ? 'black' : 'currentColor' }}"
                             class="w-3 h-3 inline-block">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M8.25 6.75L12 3m0 0l3.75 3.75M12 3v18"/>
                        </svg>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="{{ $sortColumnName === 'grand_total' && $sortDirection === 'desc' ? 'black' : 'currentColor' }}"
                             class="w-3 h-3 inline-block">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M15.75 17.25L12 21m0 0l-3.75-3.75M12 21V3"/>
                        </svg>
                    </th>
                    <th class="px-6 py-3 bg-gray-50 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                        Status
                    </th>
                    <th wire:click.prevent="sortBy('created_at')" style="width:150px;cursor:pointer"
                        class="px-6 py-3 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
                        Date
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="{{ $sortColumnName === 'created_at' && $sortDirection === 'asc' ? 'black' : 'currentColor' }}"
                             class="w-3 h-3 inline-block">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M8.25 6.75L12 3m0 0l3.75 3.75M12 3v18"/>
                        </svg>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                             stroke="{{ $sortColumnName === 'created_at' && $sortDirection === 'desc' ? 'black' : 'currentColor' }}"
                             class="w-3 h-3 inline-block">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M15.75 17.25L12 21m0 0l-3.75-3.75M12 21V3"/>
                        </svg>
                    </th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">

                @forelse ($orders as $order)
                    <tr class="bg-white">
                        <td class="px-6 py-4 text-left whitespace-nowrap text-sm text-gray-500">
                            <div class="flex items-center">
                                <a href="{{ route('adminOrders.show',$order->id) }}"
                                   class="group inline-flex space-x-2 truncate text-sm">
                                    <div class="flex-shrink-0 h-10 w-10">
                                        <img class="h-10 w-10" src="/uploads/icon/order.svg"
                                             alt=""/>
                                    </div>
                                </a>
                                <a href="{{ route('adminOrders.show',$order->id) }}"
                                   class="ml-3">


                                    <div class="text-sm leading-5 font-medium text-gray-900">
                                        # {{ $order->order_number }}</div>
                                </a>
                            </div>
                        </td>
                        <td class="px-6 py-4 pr-4 whitespace-nowrap text-sm text-gray-900">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 h-10 w-10">
                                    <img class="h-10 w-10" src="/uploads/icon/avatar.svg" alt=""/>
                                </div>

                                <div class="ml-4">
                                    <div
                                        class="text-sm leading-5 font-medium text-gray-900">{{ $order->billing_name }}</div>
                                    <div class="text-sm leading-5 text-gray-500">{{ $order->email }}</div>
                                </div>
                            </div>
                        </td>
                        @if($order->payment_method === 'card')
                            <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500">
                                <img src="/uploads/icon/stripe.png" class="img-responsive" style="width:130px">
                            </td>
                        @endif
                        @if($order->payment_method === 'wire transfer')
                            <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500">
                                <img src="/uploads/icon/bonifico.png" class="img-responsive" style="width:130px">
                            </td>
                        @endif
                        <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500">
                                    <span
                                        class="text-gray-900 font-medium">€ {{ number_format($order->grand_total, 2, ',', ' ')}} </span>
                        </td>

                        @if($order->is_paid == '1')
                            <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-900">

                                <a href="{{ route('adminOrders.show',$order->id) }}"
                                   class="group inline-flex space-x-2 text-sm">
                                    <!-- Heroicon name: solid/cash -->
                                    <svg
                                        class="flex-shrink-0 h-5 w-5 text-gray-400 group-hover:text-gray-500"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"
                                        fill="currentColor"
                                        aria-hidden="true">
                                        <path fill-rule="evenodd"
                                              d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                                              clip-rule="evenodd"/>
                                    </svg>

                                    <p class=" text-gray-500 group-hover:text-gray-900">
                                        Payment received
                                    </p>

                                </a>

                            </td>
                        @endif

                        <td class="px-6 py-4 text-right whitespace-nowrap text-sm text-gray-500">
                            <time
                                datetime="2020-07-11">{{ Carbon\Carbon::parse($order->created_at)->format('d/m/Y H:s') }}</time>
                        </td>
                    </tr>
                @empty
                    <table class="min-w-full divide-y divide-gray-200">

                        <tbody class="bg-white divide-y divide-gray-200">
                        <tr class="bg-white">

                            <td class="max-w-0 w-full px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                <div class="flex ">
                                    <!-- Heroicon name: solid/cash -->
                                    <p class="text-gray-500  font-size-24 truncate group-hover:text-gray-900">
                                        No payment received </p>

                                </div>
                            </td>

                        </tr>


                        <!-- More transactions... -->
                        </tbody>
                    </table>
                    <!-- Pagination -->
                @endforelse


                <!-- More transactions... -->
                </tbody>
            </table>
            <!-- Pagination -->

        </div>

    </div>
    @if(isset($query))
        {{ $orders->appends($query)->onEachSide(1)->links() }}
    @else
        {{ $orders->onEachSide(1)->links('vendor.livewire.tailwind') }}
    @endif
</div>
