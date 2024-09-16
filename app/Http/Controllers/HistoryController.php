<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Notes;

class HistoryController extends Controller
{
    public function history()
    {
        $data_transaksi= Notes::all();
        return view('cart.history', compact('data_transaksi'), [
            'title' => 'History',
            'active' => 'history',
            'notes' => $data_transaksi
        ]);
    }

    public function filter(Request $request){
        $start_date = $request->start_date;
        $end_date = $request->end_date;

        $data_transaksi = Notes::whereDate('created_at','>=',$start_date)
                        ->whereDate('created_at','<=',$end_date)
                        ->get();
        
        return view('cart.history',compact('data_transaksi'), [
            'title' => 'History',
            'active' => 'history',
            'notes' => $data_transaksi
        ]);
    }
}