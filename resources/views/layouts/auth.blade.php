<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ $title }}</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  @vite('resources/css/app.css')
  {{-- <link rel="stylesheet" href="{{ asset('build/assets/app-CiQlHYby.css') }}"> --}}
</head>
<body class="bg-slate-100">
  <div class="w-full min-h-screen lg:flex lg:justify-center lg:items-center">
    @yield('container')
  </div>
  <script src="{{ asset('build/assets/app-D2jpX1vH.js') }}"></script>
</body>
</html>
