<?php
declare(strict_types=1);

use StubsGenerator\Finder;

return Finder::create()
    ->in('source/wp-cafe')
    ->in('source/overrides')
    ->sortByName(true);