<?php

namespace App\Filament\Resources\BingoConfigs\Pages;

use App\Filament\Resources\BingoConfigs\BingoConfigResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditBingoConfig extends EditRecord
{
    protected static string $resource = BingoConfigResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}
