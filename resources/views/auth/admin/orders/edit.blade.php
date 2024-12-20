@extends('backend.adminlayouts.master')

@section('body')
    @if (session()->has('success'))
        <div class="alert alert-success animated slideInRight" id="hideMe">
            <p>{!! session()->get('success')!!}   </p>
        </div>
    @endif
    @if (session()->has('danger'))
        <div class="alert alert-danger animated slideInRight" id="hideMe">
            <p>{!! session()->get('danger')!!}   </p>
        </div>
    @endif
    <form action="{{ route('customers.update', $user->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="mt-2 md:mt-0 md:col-span-2">
            <div class="shadow sm:rounded-md sm:overflow-hidden">
                <div class="px-4 py-5 bg-white space-y-6 sm:p-6">

                    <div class="grid grid-cols-3 gap-6">
                        <div class="col-span-6 sm:col-span-3 lg:col-span-2">
                            <label for="name" class="block text-sm font-medium text-gray-700">Nome</label>
                            <input type="text" name="name" id="name"
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                   value="{{ $user->name }}">
                        </div>
                    </div>
                    <div class="grid grid-cols-3 gap-6">
                        <div class="col-span-6 sm:col-span-3 lg:col-span-2">
                            <label for="name" class="block text-sm font-medium text-gray-700">Password</label>
                            <input type="text" name="password" placeholder="******" value="*******"
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                   value="{{ $user->name }}">
                        </div>
                    </div>
                    <div class="grid grid-cols-3 gap-6">
                        <div class="col-span-6 sm:col-span-3 lg:col-span-2">
                            <label for="confirm-password" class="block text-sm font-medium text-gray-700">Conferma
                                Password</label>
                            <input type="text" id="confirm-password" type="password"
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                   value="{{ $user->name }}">
                            @if ($errors->has('password'))
                                <span class="help-block text-danger">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                            @endif
                        </div>
                    </div>
                    <div class="grid grid-cols-3 gap-6">
                        <div class="col-span-6 sm:col-span-3 lg:col-span-2">
                            <label for="name" class="block text-sm font-medium text-gray-700">Email</label>
                            <input type="email" name="email" id="email"
                                   class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                   value="{{ $user->email }}">
                        </div>
                    </div>


                    <div class="text-right mt-10">
                        <a href="{{url()->previous()}}"
                           class="btn px-6 py-2.5 bg-green-600 hover:bg-green-700 text-white font-medium text-xs leading-tight uppercase rounded shadow-md  hover:shadow-lg focus:bg-yellow-900  focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out items-center">
                            Go Back
                        </a>
                        <button type="submit"
                                class="ml-7 btn px-6 py-2.5 bg-blue-700 hover:bg-blue-900 text-white font-medium text-xs leading-tight uppercase rounded shadow-md  hover:shadow-lg focus:bg-yellow-900  focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out items-center">
                            Save
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>



@endsection
