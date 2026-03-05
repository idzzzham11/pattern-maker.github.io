'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "8da76be6660aadb317124ea4d136bc03",
"assets/AssetManifest.bin.json": "1cad5c87831df5577f027f67a7806aba",
"assets/AssetManifest.json": "5be9efcc68de97ce82655100caa76ae7",
"assets/assets/images/bodices/bodice_bust_semi_yoke_step_1.jpg": "1491e5d157b163c55facec68d1712db8",
"assets/assets/images/bodices/bodice_bust_semi_yoke_step_2.jpg": "b03ea1f597fb76ca72926d634e417f4e",
"assets/assets/images/bodices/bodice_dart_cluster_step_1.jpg": "f0c2b462e3e531913d468591151e8d42",
"assets/assets/images/bodices/bodice_dart_cluster_step_2.jpg": "9de7978caf7927b488ee66258c533377",
"assets/assets/images/bodices/bodice_dart_cluster_step_3.jpg": "439972ee5fb73090361d4d0336d80143",
"assets/assets/images/bodices/bodice_double_shoulder_tucks_step_1.jpg": "d0d3bc4afa40c37e1d73df283ffb6d14",
"assets/assets/images/bodices/bodice_double_shoulder_tucks_step_2.jpg": "06111a636d211852132b65ca46a748dc",
"assets/assets/images/bodices/bodice_double_shoulder_tucks_step_3.jpg": "8177e8d8a2bec1f30e59debd4e051606",
"assets/assets/images/bodices/bodice_flange_inset_step_1.PNG": "e0b48d089b1b8699542b78a02553056f",
"assets/assets/images/bodices/bodice_flange_inset_step_2.PNG": "e6c396fe921d7c289c2dc05fbce0a708",
"assets/assets/images/bodices/bodice_flange_inset_step_3.PNG": "e6c396fe921d7c289c2dc05fbce0a708",
"assets/assets/images/bodices/bodice_flange_inset_step_4.PNG": "bd664a9d330812ec35553693f5f50f97",
"assets/assets/images/bodices/bodice_flange_inset_step_5.PNG": "3de7bdc2f778b1d664f93a5d91c5cf49",
"assets/assets/images/bodices/bodice_flange_inset_step_6.PNG": "3d8d4b76f1eb2226a873026defb0e559",
"assets/assets/images/bodices/bodice_pin_tucks_step_1.PNG": "bbca07818de59855aa28a6b420d127f9",
"assets/assets/images/bodices/bodice_pin_tucks_step_2.PNG": "b48833b62f9584aa84975da38850afcc",
"assets/assets/images/bodices/bodice_pin_tucks_step_3.PNG": "9e728678ab37b1775145e7c58da0478c",
"assets/assets/images/bodices/bodice_princess_line_step_1.jpg": "f4b833d55e146b3b4295ebaa08450acd",
"assets/assets/images/bodices/bodice_princess_line_step_2.jpg": "9b186e1866f258334ecc75c6abdff2bc",
"assets/assets/images/bodices/bodice_princess_line_step_3.jpg": "bcf14e27a994c77cc78cc8f944e29be4",
"assets/assets/images/bodices/bust_semi_yoke_bodice.jpg": "bade3fea25c06535fce15d210c356a2f",
"assets/assets/images/bodices/dart_cluster_bodice.jpg": "ccbe0b1d5f234f2a1e3a67eaa1c1a237",
"assets/assets/images/bodices/double_shoulders_tucks_bodice.jpg": "c41359554d89e6001cb00ea36d074dd5",
"assets/assets/images/bodices/flange_inset_bodice.jpg": "c613fc9c103d67f7072bfb4bd94f0977",
"assets/assets/images/bodices/pin_tucks_bodice.jpg": "da3224dfb1262a9e9bd226d8ade351a7",
"assets/assets/images/bodices/princess_line_bodice.jpg": "a7ca76fe946697cb700094e26f0a9f13",
"assets/assets/images/collars/collar_mandarin_step_1.jpg": "53a09f84a2b1c21bceb6788740737224",
"assets/assets/images/collars/collar_one_piece_shirt_step_1.JPG": "83ad5de72060d8264fb04b612feeecc5",
"assets/assets/images/collars/collar_one_piece_shirt_step_2.JPG": "472b32a1a4f1da2ce66873f7ec736929",
"assets/assets/images/collars/collar_peter_pan_step_1.JPG": "a6b5eb24c58c1d24f205de3dda1bf934",
"assets/assets/images/collars/collar_peter_pan_step_2.JPG": "6cfc7f7038b6913d23246965e5a6c0d4",
"assets/assets/images/collars/collar_sailor_step_1.jpg": "c5ba4f2c3a513cf10054c0686cadfecb",
"assets/assets/images/collars/collar_shawl_step_1.JPG": "3920f7eae2349e733e35f326e3bc6584",
"assets/assets/images/collars/collar_shawl_step_2.JPG": "e7c9a4af25816ab8ce09c50b213851b7",
"assets/assets/images/collars/mandarin_collar.jpg": "9534e84565df5c983b54129eceee0147",
"assets/assets/images/collars/no_collar.jpg": "a23beb1d5ceb3fb71d425daf7bd4fd81",
"assets/assets/images/collars/one_piece_shirt_collar.jpg": "0ae179f52609053e1dcf21ce68ec85ca",
"assets/assets/images/collars/peter_pan_collar.jpg": "5c1b8ceccb7250e3283103cf78b50c87",
"assets/assets/images/collars/sailor_collar.jpg": "35700ac20eefb85e44a323e9e63dbeca",
"assets/assets/images/collars/shawl_collar.jpg": "61dbbc6212f0e50ddab8e105957939a5",
"assets/assets/images/necklines/basic_neckline.jpg": "a23beb1d5ceb3fb71d425daf7bd4fd81",
"assets/assets/images/necklines/boat_neckline.jpg": "313f4764c83bd53ad958bd6cb3198feb",
"assets/assets/images/necklines/cowl_neckline.jpg": "63fe5cd717b84b17aef180439701c2ab",
"assets/assets/images/necklines/crossover_neckline.jpg": "5a79fe3a4b0bc646b0ca08004bb0e685",
"assets/assets/images/necklines/deep_scoop_neckline.jpg": "0200d99c3b12bc59d1805236ee424bfd",
"assets/assets/images/necklines/neckline_boat_step_1.PNG": "75fbac334b2b206101783f932b7fe7fe",
"assets/assets/images/necklines/neckline_cowl_step_1.jpg": "caf12b189eafa021383ff615db4cd51a",
"assets/assets/images/necklines/neckline_cowl_step_2.jpg": "f33ccda3776fc16a3d32a648fdd4e2b5",
"assets/assets/images/necklines/neckline_cowl_step_3.jpg": "dd8b0d4afbc6fffd0ec03905bfaf2e07",
"assets/assets/images/necklines/neckline_crossover_step_1.jpg": "18b873aef8df2b83a558de2d41292cd5",
"assets/assets/images/necklines/neckline_crossover_step_2.jpg": "7373d34696a7a9168e7cfe7670f42e1b",
"assets/assets/images/necklines/neckline_crossover_step_3.jpg": "cb2c86870937a42310c0e143a3cb60e4",
"assets/assets/images/necklines/neckline_crossover_step_4.jpg": "d64c0c3ec16781fe5e27ded2a4a3a25f",
"assets/assets/images/necklines/neckline_deep_scoop_step_1.PNG": "65dbb1174cb798b8a3d7644e2b72201c",
"assets/assets/images/necklines/neckline_v_step_1.PNG": "30a425dba81fb4bf6bc89b56b4ebf195",
"assets/assets/images/necklines/v_neckline.jpg": "cd55427373688dc32bb1f04ab3412e31",
"assets/assets/images/patterns/bodice_step_1.jpeg": "698b7c680fe3fdd99df95d457e92ea8e",
"assets/assets/images/patterns/bodice_step_2.jpeg": "862a5d16f6c72ac6486cbe430a5fcf2c",
"assets/assets/images/patterns/bodice_step_3.jpeg": "31a9c0c35411a08cddfb0f3de7bc0233",
"assets/assets/images/patterns/bodice_step_4.jpeg": "fa034bb144ed6eeedd883027652af168",
"assets/assets/images/patterns/skirt_back_step_1.jpeg": "80aab6764e4f26e14647f7ec2fe276b6",
"assets/assets/images/patterns/skirt_back_step_2.jpeg": "39ac9058bb7b3fb92e646bc72b5d615d",
"assets/assets/images/patterns/skirt_front_step_1.jpeg": "9db4ad5fea4462317df34bca4399242f",
"assets/assets/images/patterns/skirt_front_step_2.jpeg": "2fbef3d59db845ea14f33d0f1387fda6",
"assets/assets/images/patterns/sleeve_step_1.jpeg": "e2224558396f2421871c4f9962762039",
"assets/assets/images/patterns/sleeve_step_2.jpeg": "1225d896ed0e49449189730ca00d20bf",
"assets/assets/images/patterns/sleeve_step_3.jpeg": "2e70794f5400aed63dec40fab13200b7",
"assets/assets/images/patterns/sleeve_step_4.jpeg": "c5102b477f7f3c0a41e64e89b21c89ce",
"assets/assets/images/patterns/sleeve_step_5.jpeg": "19d071e8bd2c24addff31c6695280aa0",
"assets/assets/images/patterns/sleeve_step_6.jpeg": "71a2018e30dfeb3e41df8db4778ff0b6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "8f248a4b07a19a34bc01a4e1ed66cec6",
"assets/NOTICES": "801b9071543607c1d4f3cca9116d1cee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "d20a375f8b6e609a4fd0b6138c02fed9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6e065ecc8f31ea4a5ad3c88b1db91da3",
"/": "6e065ecc8f31ea4a5ad3c88b1db91da3",
"main.dart.js": "15404bb007c5d1b88c0e5281681efecd",
"manifest.json": "e28d8c932fa7b513d393bf8f693aa907",
"version.json": "6c6dad6b41e06989039f580f5434cfc8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
