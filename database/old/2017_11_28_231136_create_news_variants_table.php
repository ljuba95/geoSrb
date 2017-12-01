<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateNewsVariantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('news_variants', function (Blueprint $table) {
            $table->increments('id');//surogat

            $table->integer('news_id')->unsigned();
            $table->integer('language_id')->unsigned()->nullable();
            $table->string('title');
            $table->string('description');
            $table->text('body');

            $table->timestamps();

            $table->unique(['news_id','language_id']);
            //brisanjem vesti, brisu se sve njene jezicke varijante
            $table->foreign('news_id')->references('id')->on('news')
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
        Schema::dropIfExists('news_variants');
    }
}
