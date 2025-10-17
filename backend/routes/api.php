<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\BingoConfig;
use App\Models\User;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/bingo-config', function () {
    $config = BingoConfig::first();
    if (!$config) {
        return response()->json(['error' => 'No bingo configuration found'], 404);
    }
    
    // Transform activities to simple array for frontend
    $activities = collect($config->activities)->pluck('activity')->toArray();
    
    return [
        'id' => $config->id,
        'board_size' => $config->board_size,
        'lines_to_win' => $config->lines_to_win,
        'activities' => $activities,
    ];
});

Route::post('/register-participation', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
    ]);

    $email = $request->input('email');
    
    // Check if user already exists
    $user = User::where('email', $email)->first();
    
    if (!$user) {
        // Create a new user with just email (no password required for this use case)
        $user = User::create([
            'name' => explode('@', $email)[0], // Use email prefix as name
            'email' => $email,
            'password' => bcrypt(uniqid()), // Generate a random password
        ]);
    }
    
    return response()->json([
        'message' => 'Participation registered successfully',
        'user_id' => $user->id,
    ], 201);
});
