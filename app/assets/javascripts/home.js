// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

;(function () {
  'use strict';

  let asyncQuery = function (url) {
    return new Promise(function(resolve, reject) {
      const xhr = new XMLHttpRequest();
      xhr.open('GET', url);
      xhr.onload = () => resolve(xhr);
      xhr.onerror = () => reject(xhr);
      xhr.send();
    });
  };

  let game = new Phaser.Game(800, 600, Phaser.AUTO, 'game-scene', { preload: preload, create: create, update: update });

  function preload() {
  }

  function create() {
    let style, text;

    style = { font: "bold 32px sans-serif", fill: "#fff", boundsAlignH: "center", boundsAlignV: "middle" };

    text = game.add.text(0, 0, '', style);
    text.setShadow(3, 3, 'rgba(0,0,0,0.5)', 2);
    text.setTextBounds(0, 100, 800, 100);

    asyncQuery('/api/test/hello_world.json')
      .then(function (res) {
        if (res.status >= 400) {
          return console.log(res.status);
        }
        text.setText(JSON.parse(res.responseText).message);
      }).catch(function (err) {
        console.log(err.statusText);
      });
  }

  function update() {
  }
})();
