@extends('dashboard')

@section('content')
    <style>
        body {
            background-color: #121212;
            color: #f0f0f0;
        }

        table {
            width: 60%;
            margin: 50px auto;
            border-collapse: collapse;
            background-color: #1e1e1e;
            color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
        }

        thead {
            background-color: #2a2a2a;
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        tr:hover {
            background-color: #2c2c2c;
        }
    </style>

    <main class="login-form">
        <div class="container">
            <div class="row justify-content-center">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{ $messi->id }}</td>
                            <td>{{ $messi->name }}</td>
                            <td>{{ $messi->email }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
@endsection
