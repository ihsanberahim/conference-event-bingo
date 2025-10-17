<?php

namespace App\Filament\Resources\BingoConfigs\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Repeater;
use Filament\Schemas\Schema;

class BingoConfigForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('board_size')
                    ->required()
                    ->numeric()
                    ->minValue(3)
                    ->maxValue(10)
                    ->label('Board Size')
                    ->helperText('Size of the BINGO board (e.g., 4 for a 4x4 grid)'),
                TextInput::make('lines_to_win')
                    ->required()
                    ->numeric()
                    ->minValue(1)
                    ->maxValue(10)
                    ->label('Lines to Win')
                    ->helperText('Number of completed lines required to win'),
                Repeater::make('activities')
                    ->required()
                    ->label('Bingo Activities')
                    ->schema([
                        TextInput::make('activity')
                            ->required()
                            ->label('Activity')
                            ->placeholder('Enter a bingo activity...'),
                    ])
                    ->defaultItems(20)
                    ->addActionLabel('Add Activity')
                    ->reorderable()
                    ->collapsible()
                    ->columnSpanFull(),
            ]);
    }
}
