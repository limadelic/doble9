export default function RootLayout({ children }) {
  return (
    <html>
      <body style={{margin: 0, padding: 0, background: 'url(/img/table.jpg) repeat', color: 'black'}}>
        {children}
      </body>
    </html>
  );
}
