<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Midtrans Payment</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Figtree:wght@400;600;700&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Figtree', 'sans-serif'],
                    },
                },
            }
        }
    </script>
</head>
<body class="h-screen flex items-center justify-center bg-gray-100 font-sans">

    <div class="bg-white shadow p-8 w-full max-w-sm">
        <h2 class="text-center text-2xl font-semibold mb-6">Midtrans Payment (Donation)</h2>

        <form id="payForm" class="flex flex-col gap-4">
            <input type="email" name="customerEmail" placeholder="Enter your email" required
                   class="border border-gray-300 p-2 focus:outline-none focus:ring-2 focus:ring-gray-500 rounded-none">
            <input type="number" name="amount" placeholder="Enter amount" required min="1"
                   class="border border-gray-300 p-2 focus:outline-none focus:ring-2 focus:ring-gray-500 rounded-none">
            <button type="submit" class="bg-black text-white p-2 hover:opacity-90 rounded-none">
                Pay
            </button>
        </form>

        <script>
            document.getElementById('payForm').addEventListener('submit', async function(e) {
                e.preventDefault();
                const amount = this.amount.value;
                const customerEmail = this.customerEmail.value;

                const response = await fetch('pay?amount=' + amount + '&customerEmail=' + encodeURIComponent(customerEmail), { method: 'POST' });
                const redirectURL = await response.text();
                window.location.href = redirectURL;
            });
        </script>
    </div>

</body>
</html>