<?php

namespace App\Filament\Resources\BingoConfigs;

use App\Filament\Resources\BingoConfigs\Pages\CreateBingoConfig;
use App\Filament\Resources\BingoConfigs\Pages\EditBingoConfig;
use App\Filament\Resources\BingoConfigs\Pages\ListBingoConfigs;
use App\Filament\Resources\BingoConfigs\Schemas\BingoConfigForm;
use App\Filament\Resources\BingoConfigs\Tables\BingoConfigsTable;
use App\Models\BingoConfig;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class BingoConfigResource extends Resource
{
    protected static ?string $model = BingoConfig::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $navigationLabel = 'Bingo Configuration';

    protected static ?string $modelLabel = 'Bingo Config';

    protected static ?string $pluralModelLabel = 'Bingo Configs';

    public static function form(Schema $schema): Schema
    {
        return BingoConfigForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return BingoConfigsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListBingoConfigs::route('/'),
            'create' => CreateBingoConfig::route('/create'),
            'edit' => EditBingoConfig::route('/{record}/edit'),
        ];
    }
}
