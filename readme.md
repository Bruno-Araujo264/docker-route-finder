
# ☕ RouteFinder - Deploy da Aplicação Java

Este repositório contém o script `deploy-java.sh` responsável por automatizar o processo de **build**, **criação da imagem Docker** e **execução do container** da aplicação Java do projeto **RouteFinder**.

---

## 🚀 Pré-requisitos

Antes de executar o script, certifique-se de que você possui:

- ✅ Docker instalado
- ✅ Maven instalado
- ✅ Permissões de administrador (`sudo`)

---

## 📥 Clonando o repositório da aplicação Java

Clone o projeto diretamente na branch `main`:

```bash
git clone -b main https://github.com/GiovanaZukauskas/RouteFinder_JavaApplication.git
```

> ⚠️ **Importante:** O script espera que o projeto esteja no seguinte caminho:
>
> `/home/ubuntu/RouteFinder_JavaApplication`
>
> Se você clonar em outro local, será necessário ajustar os caminhos no `deploy-java.sh`.

---

## 🔐 Dando permissão ao script

Conceda permissão de execução ao script:

```bash
chmod +x deploy-java.sh
```

---

## ▶️ Executando o script

Para executar o deploy:

```bash
./deploy-java.sh
```

---

## 🛠️ O que o script faz

1. 🔄 Remove containers e imagens antigas (se existirem)
2. ⬇️ Atualiza o projeto com `git pull`
3. 🧹 Roda `mvn clean package`
4. 📦 Move o JAR gerado para a pasta `/home/ubuntu/`
5. 🌐 Verifica e cria a rede Docker `ubuntu_rede-ec2` (se necessário)
6. 🛠️ Constrói a imagem Docker com base no `Dockerfile-Java`
7. 🚢 Executa o container `ContainerJava` na rede `ubuntu_rede-ec2`

---

## ✅ Resultado esperado

Após a execução, o container `ContainerJava` estará rodando com a imagem `imagem-java:v1` e conectado à rede Docker `ubuntu_rede-ec2`.

---

## 🧩 Dúvidas ou melhorias?

Fique à vontade para abrir uma issue ou sugerir melhorias! 😊
