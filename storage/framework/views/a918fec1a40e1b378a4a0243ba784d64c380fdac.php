<div>
    <div>
        <div>
            <!--<form action="http://www.geosrbija.rs/rga/rga_metadatabrowser.aspx?gui=1&lang=3">
             <input type="submit" value="Pregled metapodataka" /> -->
                <button class="btn side-button btn-success" type="submit"><?php echo app('translator')->getFromJson('main.metaOverview'); ?></button>
           <!-- </form> -->
        </div>
        <div>
            <!--<form action="https://a3.geosrbija.rs/">-->
            
                <button class="btn side-button btn-success" type="submit"><?php echo app('translator')->getFromJson('main.cartography'); ?></button>
            <!--</form>-->
        </div>
    </div>
    <div>
        <p class="text"> <?php echo app('translator')->getFromJson('main.links'); ?> </p>
        <div>
            <?php $__currentLoopData = $linkGroups; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $group): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <b><?php echo e($group->name); ?></b>
                    <?php $__currentLoopData = $group->links; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $link): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <ul>
                        <a class="link" href="<?php echo e($link->url); ?>"><?php echo e($link->name); ?></a>
                </ul>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </table>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    
        </div>
    </div>
</div>

