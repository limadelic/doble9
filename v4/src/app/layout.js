export default function RootLayout({ children }) {
  return (
    <html>
      <body style={{margin: 0, padding: 0, background: 'white', color: 'black'}}>
        {children}
      </body>
    </html>
  );
}
