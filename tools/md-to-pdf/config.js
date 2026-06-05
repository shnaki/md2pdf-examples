'use strict';

module.exports = {
  pdf_options: {
    format: 'A4',
    margin: { top: '25mm', right: '25mm', bottom: '25mm', left: '25mm' },
    printBackground: true,
  },
  launch_options: {
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
    executablePath: process.env.PUPPETEER_EXECUTABLE_PATH || undefined,
  },
  // Inject CSS for Japanese fonts and code highlighting
  stylesheet: [],
  css: `
    @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;700&family=Noto+Sans+JP:wght@400;700&display=swap');

    body {
      font-family: 'Noto Serif JP', 'Noto Serif CJK JP', serif;
      font-size: 11pt;
      line-height: 1.7;
      color: #222;
      max-width: none;
      padding: 0;
      margin: 0;
    }
    h1, h2, h3, h4, h5, h6 {
      font-family: 'Noto Sans JP', 'Noto Sans CJK JP', sans-serif;
      font-weight: 700;
    }
    h1 { font-size: 20pt; border-bottom: 2px solid #4A90D9; padding-bottom: 4pt; }
    h2 { font-size: 16pt; }
    h3 { font-size: 13pt; }
    code, pre {
      font-family: 'Noto Sans Mono CJK JP', 'Courier New', monospace;
      font-size: 9pt;
      background-color: #f5f5f5;
    }
    pre {
      padding: 8pt;
      border: 1px solid #ddd;
      border-radius: 4px;
      overflow-x: auto;
      white-space: pre-wrap;
      word-break: break-all;
    }
    table {
      border-collapse: collapse;
      width: 100%;
      margin: 1em 0;
      font-size: 10pt;
    }
    th, td { border: 1px solid #ccc; padding: 6pt 8pt; }
    th { background-color: #4A90D9; color: white; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    blockquote {
      border-left: 4px solid #4A90D9;
      margin: 1em 0;
      padding: 0.5em 1em;
      color: #555;
      background-color: #f0f6ff;
    }
    img { max-width: 100%; }
  `,
  // md-to-pdf uses remark with github-flavored-markdown, math via highlight.js
  marked_options: {},
};
