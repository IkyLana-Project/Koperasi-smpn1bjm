<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login()
    {
        return view('auth.login', [
            'title' => 'Login',
        ]);
    }

    public function loginApp(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email:dns',
            'password' => 'required'
        ]);

        if(Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->intended('/');
        }

        return back()->with('loginError', 'Login Failed!');
    }

    public function registration()
    {
        return view('auth.registration', [
            'title' => 'Registration'
        ]);
    }

    public function registrationApp(Request $request)
    {
        $validated = $request->validate([
            'email' => 'required',
            'password' => 'required',
            'confirm' => 'required|same:password'
        ]);

        $validated['password'] = Hash::make($request->input('password'));

        User::create($validated);

        return redirect('/login')->with('success', 'Akun Berhasil dibuat, silahkan login');
    }

    public function logout()
    {
        Auth::logout();

        request()->session()->invalidate();

        request()->session()->regenerateToken();

        return redirect('/login');
    }
}
