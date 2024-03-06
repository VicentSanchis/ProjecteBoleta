// Detecta canvis en el mode clar/fosc
const detectThemeChange = () => {
  const theme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  applyMermaidStyles(theme);
};

// Aplica els estils Mermaid corresponents
const applyMermaidStyles = (theme) => {
  const mermaidDiagram = document.querySelector('.mermaid');
  if (mermaidDiagram) {
      if (theme === 'dark') {
          mermaidDiagram.style.backgroundColor = 'black';
          // Altres estils per al mode fosc
      } else {
          mermaidDiagram.style.backgroundColor = 'white';
          // Altres estils per al mode clar
      }
  }
};

// Executa la detecció inicial del tema
detectThemeChange();

// Escolta els canvis en el tema
window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', detectThemeChange);

  