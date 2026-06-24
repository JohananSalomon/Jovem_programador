import tkinter as tk
from tkinter import messagebox

janela = tk.Tk()
janela.title("jovem programador")
janela.geometry("500x420")
janela.configure(bg="#1e1e2e")

titulo = tk.Label(
    janela,
    text="Certificado de conquista",
    font=("Arial", 16, "bold"),
    fg="#a0a0c0",
    bg="#1e1e2e"
)

titulo.pack(pady=20)

subtitulo = tk.Label(
    janela,
    text="Modulo: python",
    font=("Arial", 12),
    fg="#a0a0c0",
    bg="#1e1e2e"
)

subtitulo.pack()

separador = tk.Label(
    janela,
    text="-" * 40,
    fg="#444466",
    bg="#1e1e2e"
)

separador.pack(pady=10)

instrucao = tk.Label(
    janela,
    text="Digite seu nome para gerar o cartão",
    font=("Arial",12),
    fg="#cdd6f4"
    bg="#1e1e2e"
)

instrucao.pack(pady(5, 5))

campo_nome - tk.entry(
    janela,
    font=("Arial",12),
    width=28,
    justify="ccenter",
    bg="#313244",
    fg="#cdd6f4",
    insertbackground= "#f9c74f",
    relief= "flat"
    bd=6
)

campo_nome.pack(pady=5)

resultado = tk.Label(
    janela,
    text="",
    font=("Arial",12),
    fg="#ae63a1",
    bg="#1e1e2e"
    wraplength=420,
    justify="center"
)
resultado.pack(pady=15)

def gerar_cartao():
    nome=campo_nome.get()

    if nome = "":
        messagebox.showwarning("Digite um nome valido")
        return 

    mensagem = (
        
    )