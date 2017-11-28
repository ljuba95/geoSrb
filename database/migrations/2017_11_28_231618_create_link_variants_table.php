<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLinkVariantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('link_variants', function (Blueprint $table) {

            $table->increments('id');//surogat
            $table->integer('link_id')->unsigned();
            $table->integer('language_id')->unsigned()->nullable();
            $table->string('label');//naziv linka na konkretnom jeziku
            $table->timestamps();

            $table->unique(['link_id','language_id']);
            //brisanjem link-a, brisu se sve njegove jezicke varijante.

            $table->foreign('link_id')->references('id')->on('links')
                ->onUpdate('restrict')
                ->onDelete('cascade');

            $table->foreign('language_id')->references('id')->on('languages')
                ->onUpdate('restrict')
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
        Schema::dropIfExists('link_variants');
    }
}
