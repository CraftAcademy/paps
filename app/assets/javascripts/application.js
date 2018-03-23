// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


document.addEventListener("turbolinks:load", function () {
    setUpObserver();

    getPosition({
        enableHighAccuracy: true
    }).then(function (position) {
        var c = {
            latitude: position.coords.latitude,
            longitude: position.coords.longitude
        };
        setCookie('geocoderLocation', JSON.stringify(c))
            .then(function () {
                redirectWithLocation();
                document.body.dataset.geocoded = true;
            }).catch(function (error) {
            console.log(error);
        });
    }).catch(function (error) {
        console.log(error);
    });
});

function getPosition(options) {
    if (document.body.dataset.env === 'test') {
        return new Promise(function (resolve) {
            var fakePosition = JSON.parse(document.getElementById('fake_position').content);
            resolve({
                coords: {
                    latitude: fakePosition.coords.latitude,
                    longitude: fakePosition.coords.longitude
                }
            });
        });
    } else {
        return new Promise(function (resolve, reject) {
            navigator.geolocation.getCurrentPosition(function (position) {
                return resolve(position);
            }, function (error) {
                return reject(error);
            }, options);
        });
    }
}

function redirectWithLocation() {
    var url = new URL(window.location.href);

    if (document.body.dataset.geocoded !== 'true') {
        window.location.replace(url);
    }
}

function setCookie(name, value) {
    var days = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : 7;
    var path = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : '/';

    return new Promise(function (resolve) {
        var expires = new Date(Date.now() + days * 864e5).toUTCString();
        document.cookie = name + '=' + encodeURIComponent(value) + '; expires=' + expires + '; path=' + path;
        resolve();
    });
}

// Ignore this
function getCookie(name) {
    return new Promise(function (resolve) {
        var value = document.cookie.split('; ').reduce(function (r, v) {
            var parts = v.split('=');
            return parts[0] === name ? decodeURIComponent(parts[1]) : r
        }, '');
        resolve(value);
    })
}

function setUpObserver() {
    var element = document.querySelector('body');
    var callback = function (mutations) {
        mutations.forEach(function (mutation) {
            if (mutation.type === "attributes") {
                initiateMap()
            }
        });
    };
    var observer = new MutationObserver(callback);
    observer.observe(element, {
        attributes: true
    });
}
