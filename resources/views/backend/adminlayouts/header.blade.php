<header class="flex justify-between items-center py-4 px-6 bg-white border-b-4 border-blue-900">
    <div class="flex items-center">
        <button @click="sidebarOpen = true" class="text-gray-500 focus:outline-none lg:hidden">
            <svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M4 6H20M4 12H20M4 18H11" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                      stroke-linejoin="round"/>
            </svg>
        </button>
    </div>
    <div class="flex items-center">
        <div x-data="{ notificationOpen: false }" class="relative">
            <button @click="notificationOpen = ! notificationOpen" class="flex mx-4 text-gray-600 focus:outline-none">
                @if($notifications->count())
                    <span class="fa-stack fa-1x" data-count="{{$notifications->count()}}">
                     <svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M15 17H20L18.5951 15.5951C18.2141 15.2141 18 14.6973 18 14.1585V11C18 8.38757 16.3304 6.16509 14 5.34142V5C14 3.89543 13.1046 3 12 3C10.8954 3 10 3.89543 10 5V5.34142C7.66962 6.16509 6 8.38757 6 11V14.1585C6 14.6973 5.78595 15.2141 5.40493 15.5951L4 17H9M15 17V18C15 19.6569 13.6569 21 12 21C10.3431 21 9 19.6569 9 18V17M15 17H9"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round"/>
                     </svg>
                </span>
                @else
                    <span class="fa-stack fa-1x">
                     <svg class="h-6 w-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M15 17H20L18.5951 15.5951C18.2141 15.2141 18 14.6973 18 14.1585V11C18 8.38757 16.3304 6.16509 14 5.34142V5C14 3.89543 13.1046 3 12 3C10.8954 3 10 3.89543 10 5V5.34142C7.66962 6.16509 6 8.38757 6 11V14.1585C6 14.6973 5.78595 15.2141 5.40493 15.5951L4 17H9M15 17V18C15 19.6569 13.6569 21 12 21C10.3431 21 9 19.6569 9 18V17M15 17H9"
                            stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round"/>
                     </svg>
                @endif
            </button>
            <div x-show="notificationOpen" @click="notificationOpen = false"
                 class="fixed inset-0 h-full w-full z-10"></div>
            <div x-show="notificationOpen"
                 class="absolute right-0 mt-2 w-80 bg-white rounded-lg shadow-xl overflow-hidden z-10"
                 style="width:20rem;">
                @if($notifications->count() > 0)
                    @foreach( $notifications as $notify)
                        @if($notify->order_id)
                            <a href="{{ route('adminOrders.show', $notify->order_id) }}"
                               class="flex items-center px-4 py-3 text-gray-600 hover:text-white hover:bg-blue-900 -mx-2">
                                <svg class="svg-icon font-size-11" viewBox="0 0 20 20" style="height:20px">
                                    <path
                                        d="M17.35,2.219h-5.934c-0.115,0-0.225,0.045-0.307,0.128l-8.762,8.762c-0.171,0.168-0.171,0.443,0,0.611l5.933,5.934c0.167,0.171,0.443,0.169,0.612,0l8.762-8.763c0.083-0.083,0.128-0.192,0.128-0.307V2.651C17.781,2.414,17.587,2.219,17.35,2.219M16.916,8.405l-8.332,8.332l-5.321-5.321l8.333-8.332h5.32V8.405z M13.891,4.367c-0.957,0-1.729,0.772-1.729,1.729c0,0.957,0.771,1.729,1.729,1.729s1.729-0.772,1.729-1.729C15.619,5.14,14.848,4.367,13.891,4.367 M14.502,6.708c-0.326,0.326-0.896,0.326-1.223,0c-0.338-0.342-0.338-0.882,0-1.224c0.342-0.337,0.881-0.337,1.223,0C14.84,5.826,14.84,6.366,14.502,6.708"></path>
                                </svg>
                                <p class="text-sm mx-2">
                                    Request <span
                                        class="font-bold">new order</span>
                                    - {{ Carbon\Carbon::parse($notify->created_at)->diffForHumans() }}
                                </p>
                            </a>
                        @endif
                        @foreach( collect(json_decode($notify->data, true)) as $key => $value )
                            @if($key == 'email_subscription')

                                <a href="{{ route('subscribers.index') }}"
                                   class="flex items-center px-4 py-3 text-gray-600 hover:text-white hover:bg-blue-900 -mx-2">
                                    <svg class="svg-icon font-size-11" viewBox="0 0 20 20" style="height:20px">
                                        <path
                                            d="M17.35,2.219h-5.934c-0.115,0-0.225,0.045-0.307,0.128l-8.762,8.762c-0.171,0.168-0.171,0.443,0,0.611l5.933,5.934c0.167,0.171,0.443,0.169,0.612,0l8.762-8.763c0.083-0.083,0.128-0.192,0.128-0.307V2.651C17.781,2.414,17.587,2.219,17.35,2.219M16.916,8.405l-8.332,8.332l-5.321-5.321l8.333-8.332h5.32V8.405z M13.891,4.367c-0.957,0-1.729,0.772-1.729,1.729c0,0.957,0.771,1.729,1.729,1.729s1.729-0.772,1.729-1.729C15.619,5.14,14.848,4.367,13.891,4.367 M14.502,6.708c-0.326,0.326-0.896,0.326-1.223,0c-0.338-0.342-0.338-0.882,0-1.224c0.342-0.337,0.881-0.337,1.223,0C14.84,5.826,14.84,6.366,14.502,6.708"></path>
                                    </svg>
                                    <p class="text-sm mx-2">
                                        New user subscripted to the <span
                                            class="font-bold">newsletter</span>
                                        - {{ Carbon\Carbon::parse($notify->created_at)->diffForHumans() }}
                                    </p>
                                </a>
                            @endif
                        @endforeach
                        @foreach( collect(json_decode($notify->data, true)) as $key => $value )
                            @if($key == 'billing_name')
                                <a href="{{ route('customers.index') }}"
                                   class="flex items-center px-4 py-3 text-gray-600 hover:text-white hover:bg-blue-900 -mx-2">
                                    <svg class="svg-icon font-size-11" viewBox="0 0 20 20" style="height:20px">
                                        <path
                                            d="M17.35,2.219h-5.934c-0.115,0-0.225,0.045-0.307,0.128l-8.762,8.762c-0.171,0.168-0.171,0.443,0,0.611l5.933,5.934c0.167,0.171,0.443,0.169,0.612,0l8.762-8.763c0.083-0.083,0.128-0.192,0.128-0.307V2.651C17.781,2.414,17.587,2.219,17.35,2.219M16.916,8.405l-8.332,8.332l-5.321-5.321l8.333-8.332h5.32V8.405z M13.891,4.367c-0.957,0-1.729,0.772-1.729,1.729c0,0.957,0.771,1.729,1.729,1.729s1.729-0.772,1.729-1.729C15.619,5.14,14.848,4.367,13.891,4.367 M14.502,6.708c-0.326,0.326-0.896,0.326-1.223,0c-0.338-0.342-0.338-0.882,0-1.224c0.342-0.337,0.881-0.337,1.223,0C14.84,5.826,14.84,6.366,14.502,6.708"></path>
                                    </svg>
                                    <p class="text-sm mx-2">
                                        New utente <span
                                            class="font-bold">registrato</span>
                                        - {{ Carbon\Carbon::parse($notify->created_at)->diffForHumans() }}
                                    </p>
                                </a>
                            @endif
                        @endforeach
                    @endforeach
                @else
                    <a href="#"
                       class="flex items-center px-4 py-3 text-gray-600 hover:text-white hover:bg-blue-900 -mx-2">
                        <svg class="svg-icon font-size-11" viewBox="0 0 20 20" style="height:20px">
                            <path
                                d="M17.35,2.219h-5.934c-0.115,0-0.225,0.045-0.307,0.128l-8.762,8.762c-0.171,0.168-0.171,0.443,0,0.611l5.933,5.934c0.167,0.171,0.443,0.169,0.612,0l8.762-8.763c0.083-0.083,0.128-0.192,0.128-0.307V2.651C17.781,2.414,17.587,2.219,17.35,2.219M16.916,8.405l-8.332,8.332l-5.321-5.321l8.333-8.332h5.32V8.405z M13.891,4.367c-0.957,0-1.729,0.772-1.729,1.729c0,0.957,0.771,1.729,1.729,1.729s1.729-0.772,1.729-1.729C15.619,5.14,14.848,4.367,13.891,4.367 M14.502,6.708c-0.326,0.326-0.896,0.326-1.223,0c-0.338-0.342-0.338-0.882,0-1.224c0.342-0.337,0.881-0.337,1.223,0C14.84,5.826,14.84,6.366,14.502,6.708"></path>
                        </svg>
                        <p class="text-sm mx-2">
                            Nessun <span
                                class="font-bold">nuovo ordine</span>
                        </p>
                    </a>
                @endif
            </div>
        </div>

        <div x-data="{ dropdownOpen: false }" class="relative">
            <button @click="dropdownOpen = ! dropdownOpen"
                    class="relative inline-block h-8 w-8 rounded-full overflow-hidden shadow focus:outline-none">
                <img class="h-full w-full object-cover" src="/uploads/icon/avatar.png" alt="Your avatar">
            </button>
            <div x-show="dropdownOpen" @click="dropdownOpen = false" class="fixed inset-0 h-full w-full z-10"></div>
            <div x-show="dropdownOpen"
                 class="absolute right-0 mt-2 w-48 bg-white rounded-md overflow-hidden shadow-xl z-10">
                {{-- <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-blue-900 hover:text-white">Profile</a>
                <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-blue-900 hover:text-white">Products</a> --}}
                @if(Auth::guard('admin')->user())
                    <!-- Active: "bg-gray-100", Not Active: "" -->
                    {{--                     <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0">Your Profile</a>--}}
                    {{--                    <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-1">Settings</a>--}}
                    <a class="block px-4 py-2 text-sm text-gray-700 hover:bg-blue-900 hover:text-white"
                       href="{{ route('logout') }}"
                       onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                        {{ __('Logout') }}
                    </a>
                    <form id="logout-form" action="{{ route('adminLogout') }}" method="POST"
                          class="d-none">
                        @csrf
                    </form>
                @endif
            </div>
        </div>
    </div>
</header>
