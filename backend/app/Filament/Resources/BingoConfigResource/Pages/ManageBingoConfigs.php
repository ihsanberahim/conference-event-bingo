<?php

namespace App\Filament\Resources\BingoConfigResource\Pages;

use App\Filament\Resources\BingoConfigResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageBingoConfigs extends ManageRecords
{
    protected static string $resource = BingoConfigResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
