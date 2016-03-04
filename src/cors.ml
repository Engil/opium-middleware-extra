open Opium_rock
open Core_kernel.Std
open Opium.Std
open Lwt.Infix

let cors_middleware =
  let filter handler req =
    let open Opium_rock.Response in
    handler req >>= fun response ->
    let headers = Cohttp.Header.add response.headers
        "Access-Control-Allow-Origin" "*" in
    Lwt.return { response with headers } in
  Rock.Middleware.create ~name:(Info.of_string "CORS headers for Opium") ~filter
