---
title: Nextjs Authentication for Blog
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Nextjs Authentication for Blog

## ✅ TODOs


## 📌 Summary
Nextjs authentication for a blog

## 🧠 Full Chat


Nextjs authentication for a blog 



Implementing authentication in a Next.js blog involves a few key steps, including setting up a user authentication system and protecting certain routes. Here's a step-by-step guide to help you get started:

### Step 1: Set Up Next.js Project

First, create a new Next.js project if you don't have one already:

```bash
npx create-next-app@latest my-nextjs-blog
cd my-nextjs-blog
```

### Step 2: Install Dependencies

You'll need to install some dependencies for authentication. For this example, we'll use `next-auth`, which is a popular authentication library for Next.js.

```bash
npm install next-auth
```

### Step 3: Create API Routes for Authentication

Next, set up API routes to handle authentication. Create a new directory named `api` inside the `pages` directory, and then create a subdirectory named `auth`:

```bash
mkdir -p pages/api/auth
```

Create a file named `[...nextauth].js` inside `pages/api/auth` and add the following code:

```javascript
import NextAuth from 'next-auth';
import Providers from 'next-auth/providers';

export default NextAuth({
  providers: [
    Providers.Google({
      clientId: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET
    }),
    // Add more providers here
  ],
  callbacks: {
    async session(session, token) {
      session.user.id = token.sub;
      return session;
    }
  }
});
```

### Step 4: Set Up Environment Variables

Create a `.env.local` file in the root of your project and add your environment variables:

```
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret
NEXTAUTH_URL=http://localhost:3000
```

Make sure to replace `your-google-client-id` and `your-google-client-secret` with your actual Google OAuth credentials.

### Step 5: Add Authentication to Your Pages

You need to wrap your application with the `Provider` component from `next-auth`. Modify your `_app.js` file:

```javascript
import { Provider } from 'next-auth/client';
import '../styles/globals.css';

function MyApp({ Component, pageProps }) {
  return (
    <Provider session={pageProps.session}>
      <Component {...pageProps} />
    </Provider>
  );
}

export default MyApp;
```

### Step 6: Protect Your Routes

To protect your routes, you can use the `useSession` hook from `next-auth`. Here's an example of how to protect a page:

```javascript
import { useSession, signIn } from 'next-auth/client';

const ProtectedPage = () => {
  const [session, loading] = useSession();

  if (loading) return <p>Loading...</p>;
  if (!session) {
    return (
      <div>
        <p>You must be signed in to view this page.</p>
        <button onClick={() => signIn()}>Sign in</button>
      </div>
    );
  }

  return <p>Protected content goes here</p>;
};

export default ProtectedPage;
```

### Step 7: Add Sign-In and Sign-Out Buttons

You can add sign-in and sign-out buttons to your blog. For example, in your navigation component:

```javascript
import { useSession, signIn, signOut } from 'next-auth/client';

const Navbar = () => {
  const [session] = useSession();

  return (
    <nav>
      {session ? (
        <>
          <p>Welcome, {session.user.name}</p>
          <button onClick={() => signOut()}>Sign out</button>
        </>
      ) : (
        <button onClick={() => signIn()}>Sign in</button>
      )}
    </nav>
  );
};

export default Navbar;
```

### Step 8: Start Your Development Server

Finally, start your development server:

```bash
npm run dev
```

Visit `http://localhost:3000` to see your blog with authentication.

By following these steps, you will have added authentication to your Next.js blog, allowing users to sign in and access protected routes.