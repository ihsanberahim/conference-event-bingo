<?php

namespace App\Filament\Resources\BingoConfigs\Pages;

use App\Filament\Resources\BingoConfigs\BingoConfigResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListBingoConfigs extends ListRecords
{
    protected static string $resource = BingoConfigResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
