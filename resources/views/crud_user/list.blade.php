@extends('dashboard')

@section('content')
    <style>
        body {
            background-color:rgb(255, 255, 255);
            color: #f0f0f0;
        }

        table {
            width: 90%;
            margin: 30px auto;
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
            padding: 12px 20px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            font-weight: bold;
        }

        tr:hover {
            background-color: #2c2c2c;
        }

        a {
            color: #0d6efd;
            text-decoration: none;
            margin: 0 5px;
        }

        a:hover {
            text-decoration: underline;
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
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($users as $user)
                            <tr>
                                <td>{{ $user->id }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>
                                    <a href="{{ route('user.readUser', ['id' => $user->id]) }}">View</a> |
                                    <a href="{{ route('user.updateUser', ['id' => $user->id]) }}">Edit</a> |
                                    <a href="{{ route('user.deleteUser', ['id' => $user->id]) }}">Delete</a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </main>
@endsection
