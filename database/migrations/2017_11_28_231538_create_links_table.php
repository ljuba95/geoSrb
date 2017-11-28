<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLinksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('links', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('link_group_id')->unsigned()->nullable();//da li moze da postoji link koji nije u grupi?
            $table->integer('user_id')->unsigned()->nullable();//da li da cuvamo uopste ko je dodao link
            $table->string('url');
            $table->boolean('active');
            $table->integer('position');
            $table->timestamps();

            //brisanjem grupe ne brisu se svi njeni linkovi
            $table->foreign('link_group_id')->references('id')->on('link_groups')
                ->onUpdate('restrict')
                ->onDelete('set null');

            $table->foreign('user_id')->references('id')->on('users')
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
        Schema::dropIfExists('links');
    }
}
