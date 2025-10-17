<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BingoConfigSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \App\Models\BingoConfig::create([
            'board_size' => 4,
            'lines_to_win' => 4,
            'activities' => [
                ['activity' => 'Ask a speaker a question'],
                ['activity' => 'Visit a sponsor booth'],
                ['activity' => 'Network with someone new'],
                ['activity' => 'Take a selfie at the event'],
                ['activity' => 'Attend a session in every track'],
                ['activity' => 'Collect a piece of swag'],
                ['activity' => 'Tweet about the conference'],
                ['activity' => 'Join a breakout session'],
                ['activity' => 'Find someone with the same first name'],
                ['activity' => 'Learn about a new open source project'],
                ['activity' => 'Post a picture of the stage'],
                ['activity' => 'Talk to someone from another country'],
                ['activity' => 'Thank a volunteer or organizer'],
                ['activity' => 'Try the conference coffee'],
                ['activity' => 'Ask for a demo at a booth'],
                ['activity' => 'Share your favorite session on social media'],
                ['activity' => 'Find the conference WiFi password'],
                ['activity' => 'Take a picture with a speaker'],
                ['activity' => 'Connect with 5 people on LinkedIn'],
                ['activity' => 'Fill out the post-event survey'],
            ],
        ]);
    }
}
