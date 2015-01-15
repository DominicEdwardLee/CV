clear all
close all
clc

gameF = figure('Color', [0.0,0.0,0.0],'Resize','off');
gameScene = axes('position',[.1,.1,.8,.8]);
hold on
axis square
axis off
axis([0 9 0 9])

sceneOne = ones(9,9);  % this is the first scene (ie the squares)
sceneOne(4:8,2) = 0;   % if is 0 then it is black
sceneOne(2:4,3) = 0;
sceneOne(8  ,3) = 0;
sceneOne(4:6,4) = 0;
sceneOne(8:9,4) = 0;
sceneOne(1:2,5) = 0;    
sceneOne(2  ,6) = 0;
sceneOne(8  ,6) = 0;
sceneOne(2  ,7) = 0;
sceneOne(4  ,7) = 0;
sceneOne(6:8,7) = 0;
sceneOne(2:6,8) = 0;
sceneOne(2 , 2) = 0.3; % making the holes to go to the other scene
sceneOne(6 , 5) = 0.3;
sceneOne(4 , 6) = 0.3;
sceneOne(8 , 8) = 0.3;


sceneTwo = ones(9,9);  % this is the second scene (ie the squares)
sceneTwo(4:8,2) = 0; % making the gaps to move through
sceneTwo(2  ,3) = 0;
sceneTwo(4  ,3) = 0;
sceneTwo(8  ,3) = 0;
sceneTwo(2  ,4) = 0;
sceneTwo(4  ,4) = 0;
sceneTwo(6:8,4) = 0;
sceneTwo(2  ,5) = 0;
sceneTwo(4  ,5) = 0;
sceneTwo(2  ,6) = 0;
sceneTwo(8  ,6) = 0;
sceneTwo(2  ,7) = 0;
sceneTwo(6:8,7) = 0;
sceneTwo(2:6,8) = 0;
sceneTwo(2  ,2) = 0.3; % making the holes to go to the other scene
sceneTwo(6  ,5) = 0.3;
sceneTwo(4  ,6) = 0.3;
sceneTwo(8  ,8) = 0.3;

%recButton = axes('position',[.85,.85,.1,.1],'selected','off');

axes = gameScene;

player = [1,5];
playerPoint = plot(player(1)-0.5,player(2)-0.5,'rx','markersize',30);

for x = 1:9
    for y = 1:9
        plot(x-0.5,y-0.5,'s','color',[sceneOne(x,y) sceneOne(x,y) sceneOne(x,y)],'markersize',30)
    end
end

active = 1;
scene = sceneOne;

while (1)
    
    disp('READY');
    pause();
    direction = Classifier();
    switch direction
        case 1
            if (player(2)+1<=9)
                if (scene(player(1),player(2)+1)~=1)
                    player(2)=player(2)+1;
                end
            end
        case 2
            if (player(2)-1>=1)
                if (scene(player(1),player(2)-1)~=1)
                    player(2)=player(2)-1;
                end
            end
        case 3
            if (player(1)-1>=1)
                if (scene(player(1)-1,player(2))~=1)
                    player(1)=player(1)-1;
                end
            end
        case 4
            if (player(1)+1<=9)
                if (scene(player(1)+1,player(2))~=1)
                    player(1)=player(1)+1;
                end
            end
    end
    
    if ((player(1)==2&&player(2)==2)||(player(1)==6&&player(2)==5)||...
            (player(1)==4&&player(2)==6)||(player(1)==8&&player(2)==8))
        
        active = active*-1;
        
        if (active>0)
            scene = sceneOne;
        else
            scene = sceneTwo;
        end
        
        for x = 1:9
            for y = 1:9
                plot(x-0.5,y-0.5,'s','color',[scene(x,y) scene(x,y) scene(x,y)],'markersize',30)
            end
        end
    end
    
    set(playerPoint, 'xdata', player(1)-0.5, 'ydata',player(2)-0.5);
    
    pause(1);
    
end

