<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;




class AuthController extends Controller
{
    //


    public function login(Request $req)
    {

        $this->validate($req,[
            'email' => 'required|string|max:100',
            'password' => 'required|string|min:4'
        ]);
        // find user email in users table
        $user = User::where('email', $req->email)->first();
        // if user email found and password is correct
        if ($user && $req->password==$user->password) {

            $response = ['user' => $user,"message"=>'working'];
            return response()->json($response, 200);
        }
        $response = ['message' => 'Incorrect email or password'];
        return response()->json($response, 400);
    }
}
