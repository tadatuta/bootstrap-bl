#!/bin/bash

mkdir -p blocks
cd blocks
#ls ../less | cut -d'.' -f1 | xargs mkdir -p

# moves each *.less file into blocks/[blockname]/ folder
for f in `ls ../less`; do
    name=`echo "$f"`
    dir=`echo "$name"|cut -d'.' -f1`
    mkdir -p "$dir"
    mv ../less/$f $dir
done

rm -rf ../less

#========renames folders to singular===============
mv alerts alert
mv badges badge
mv button-groups button-group
mv buttons button
mv component-animations component-animation
mv dropdowns dropdown
mv forms form
mv labels label
mv layouts layout
mv mixins mixin
mv modals modal
mv navs nav
mv popovers popover
mv progress-bars progress-bar
mv sprites sprite
mv tables table
mv thumbnails thumbnail
mv wells well

mv alert/alerts.less alert/alert.less
mv badge/badges.less badge/badge.less
mv button-group/button-groups.less button-group/button-group.less
mv button/buttons.less button/button.less
mv component-animation/component-animations.less component-animation/component-animation.less
mv dropdown/dropdowns.less dropdown/dropdown.less
mv form/forms.less form/form.less
mv label/labels.less label/label.less
mv layout/layouts.less layout/layout.less
mv mixin/mixins.less mixin/mixin.less
mv modal/modals.less modal/modal.less
mv nav/navs.less nav/nav.less
mv popover/popovers.less popover/popover.less
mv progress-bar/progress-bars.less progress-bar/progress-bar.less
mv sprite/sprites.less sprite/sprite.less
mv table/tables.less table/table.less
mv thumbnail/thumbnails.less thumbnail/thumbnail.less
mv well/wells.less well/well.less
#========END renames folders to singular============

#========moves imgs to sprite block=================
mv ../img/glyphicons-halflings-white.png sprite/sprite_type_white.png
mv ../img/glyphicons-halflings.png sprite/sprite.png
rm -rf ../img
#========END moves imgs to sprite block=============

#===================JS==============================
rm -rf ../js/tests ../js/README.md

for f in `ls ../js`; do
    name=`echo "$f"`
    dir=`echo "$name"|cut -d'.' -f1|cut -d'-' -f2`
    mkdir -p "$dir"
    mv ../js/$f $dir/$dir.js
done

rm -rf ../js
#================END JS=============================

#===============BEM classes=========================
#sed -i '' 's/-success/_theme_success/g' *
find . -name '*' -type f -exec sed -i '' 's/-primary/_theme_primary/' {} \;
find . -name '*' -type f -exec sed -i '' 's/-info/_theme_info/' {} \;
find . -name '*' -type f -exec sed -i '' 's/-success/_theme_success/' {} \;
find . -name '*' -type f -exec sed -i '' 's/-warning/_theme_warning/' {} \;
find . -name '*' -type f -exec sed -i '' 's/-danger/_theme_danger/' {} \;
find . -name '*' -type f -exec sed -i '' 's/-inverse/_theme_inverse/' {} \;

find . -name '*' -type f -exec sed -i '' 's/-large/_size_large/' {} \;
find . -name '*' -type f -exec sed -i '' 's/-small/_size_small/' {} \;
find . -name '*' -type f -exec sed -i '' 's/-mini/_size_mini/' {} \;

find . -name '*' -type f -exec sed -i '' 's/\.btn/.button/' {} \;
#==============END BEM classes======================

