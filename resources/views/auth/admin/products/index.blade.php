@extends('backend.adminlayouts.master')

@section('body')
    <h3 class="text-gray-700 text-3xl font-medium">Products</h3>
    <div class="mt-10">
        <div class=" text-left">
            <a href="{{route('products.create')}}"
               class="btn px-6 py-2.5 bg-green-600 hover:bg-green-700 text-white font-medium text-xs leading-tight uppercase rounded shadow-md  hover:shadow-lg focus:bg-green-900  focus:shadow-lg focus:outline-none focus:ring-0 active:bg-green-800 active:shadow-lg transition duration-150 ease-in-out items-center">
                New product
            </a>
        </div>
    </div>
    <livewire:admin-product></livewire:admin-product>
@endsection

