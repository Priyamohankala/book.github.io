HTML SCSS JSResult Skip Results Iframe
EDIT ON
(function(){
    window.CanvasSlideshow = function(options){
        //  SCOPE
    /// ---------------------------      
        var that  =   this;

        //  OPTIONS
        /// ---------------------------      
        options                     = options || {};
        options.stageWidth          = options.hasOwnProperty('stageWidth') ? options.stageWidth : 1920;
        options.stageHeight         = options.hasOwnProperty('stageHeight') ? options.stageHeight : 1080;
        options.pixiSprites         = options.hasOwnProperty('sprites') ? options.sprites : [];
        options.centerSprites       = options.hasOwnProperty('centerSprites') ? options.centerSprites : false;
        options.autoPlay            = options.hasOwnProperty('autoPlay') ? options.autoPlay : true;
        options.autoPlaySpeed       = options.hasOwnProperty('autoPlaySpeed') ? options.autoPlaySpeed : [10, 3];
        options.fullScreen          = options.hasOwnProperty('fullScreen') ? options.fullScreen : true;
        options.displacementImage   = options.hasOwnProperty('displacementImage') ?     options.displacementImage : '';
        options.displaceAutoFit     = options.hasOwnProperty('displaceAutoFit')  ?  options.displaceAutoFit : false; 
        options.wacky               = options.hasOwnProperty('wacky') ? options.wacky : false;
        options.interactive         = options.hasOwnProperty('interactive') ? options.interactive : false;
        options.interactionEvent    = options.hasOwnProperty('interactionEvent') ? options.interactionEvent : '';
        options.displacementCenter  = options.hasOwnProperty('displacementCenter') ? options.displacementCenter : false;
        options.dispatchPointerOver = options.hasOwnProperty('dispatchPointerOver') ? options.dispatchPointerOver : false;

        var renderer = new PIXI.autoDetectRenderer(options.stageWidth, options.stageHeight, { transparent: true });
        var stage = new PIXI.Container();
        var slidesContainer = new PIXI.Container();
        var displacementSprite = new PIXI.Sprite.fromImage( options.displacementImage );
        var displacementFilter  = new PIXI.filters.DisplacementFilter( displacementSprite );

        this.initPixi = function(){
            document.getElementById('js-canvas-wrapper').appendChild(renderer.view);

            stage.addChild(slidesContainer);
            stage.interactive = true;

            if(options.fullScreen === true){
                renderer.view.style.objectFit = 'cover';
                renderer.view.style.width     = '100%';
                renderer.view.style.height    = '100%';
                renderer.view.style.top       = '50%';
                renderer.view.style.left      = '50%';
                renderer.view.style.webkitTransform = 'translate( -50%, -50% ) scale(1.1)';
                renderer.view.style.transform = 'translate( -50%, -50% ) scale(1.1)';
            }else{
                renderer.view.style.maxWidth  = '100%';
                renderer.view.style.top       = '50%';
                renderer.view.style.left      = '50%';
                renderer.view.style.webkitTransform = 'translate( -50%, -50% )';
                renderer.view.style.transform = 'translate( -50%, -50% )';
            }

            displacementSprite.texture.baseTexture.wrapMode = PIXI.WRAP_MODES.REPEAT;

            // Set the filter to stage and set some default values for the animation
            stage.filters = [displacementFilter];

            if ( options.autoPlay === false ) {
                displacementFilter.scale.x = 0;
                displacementFilter.scale.y = 0;
            }

            if ( options.wacky === true ) {

                displacementSprite.anchor.set(0.5);
                displacementSprite.x = renderer.width / 2;
                displacementSprite.y = renderer.height / 2; 
            }

            displacementSprite.scale.x = 0.7;
            displacementSprite.scale.y = 0.7;

            // PIXI tries to fit the filter bounding box to the renderer so we optionally bypass
            displacementFilter.autoFit = options.displaceAutoFit;

            stage.addChild( displacementSprite );


            var texture   = new PIXI.Texture.fromImage( options.pixiSprites );
            var image     = new PIXI.Sprite( texture );

            if ( options.centerSprites === true ) {
              image.anchor.set(0.5);
              image.x = renderer.width / 2;
              image.y = renderer.height / 2;            
            }

            slidesContainer.addChild( image );
        }


        if ( options.autoPlay === true ) {

          var ticker = new PIXI.ticker.Ticker();

          ticker.autoStart = options.autoPlay;

          ticker.add(function( delta ) {

            displacementSprite.x += options.autoPlaySpeed[0] * delta;
            displacementSprite.y += options.autoPlaySpeed[1];
            renderer.render( stage );

          });

        }  else {

          var render = new PIXI.ticker.Ticker();

          render.autoStart = true;

          render.add(function( delta ) {
            renderer.render( stage );
          });        

        } 

        this.init = function() {
          that.initPixi();
        };

        /// ---------------------------
        //  START 
        /// ---------------------------           
        //this.init();
    }
})();


var initCanvasSlideshow = new CanvasSlideshow({
  sprites: 'https://raw.githubusercontent.com/Pierrinho/elephant/master/bg-novius-1920.jpg',
  displacementImage: 'https://images.pexels.com/photos/1572563/pexels-photo-1572563.jpeg',
  autoPlay: true,
  autoPlaySpeed: [0, 6],
  interactive: true,
  interactionEvent: 'click', // 'click', 'hover', 'both' 
  displaceAutoFit: false,
  dispatchPointerOver: true // restarts pointerover event after click 
});

initCanvasSlideshow.init();


Resources1× 0.5× 0.25×Rerun