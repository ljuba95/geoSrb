<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('files', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('file_category_id')->unsigned()->nullable();
            $table->string('label');
            $table->dateTime('publishDate');
            $table->string('pathOnDisk');
            $table->integer('downloadCount')->unsigned()->default('0');
            $table->timestamps();

            //ne brisemo fajlove ako se obrise njihova kategorija
            $table->foreign('file_category_id')->references('id')->on('file_categories')
                ->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('files');
    }
}
