<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePageVariantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('page_variants', function (Blueprint $table) {
            $table->increments('id');//surogat kljuc
            $table->integer('page_id')->unsigned();
            $table->integer('language_id')->unsigned()->nullable();
            $table->string('title');
            $table->mediumText('body');
            $table->timestamps();

            //constraints
            // postize se relacioni model agregacije(many to many) bez slozenog primarnog kljuca
            //Eloquent ne podrzava slozene primarne kljuceve

            $table->unique(['page_id','language_id']);

            $table->foreign('page_id')->references('id')->on('pages')
                ->onUpdate('restrict')
                ->onDelete('cascade');
            //brisanjem stranice, brisu se sve njene varijante? - po meni ok..

            $table->foreign('language_id')->references('id')->on('languages')
                ->onUpdate('restrict')
                ->onDelete('set null');
            //brisanjem jezika samo stavljamo kljuc na null, ali sto bi bilo ko brisao jezike..
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('page_variants');
    }
}
