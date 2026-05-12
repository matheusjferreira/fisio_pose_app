# Fisio Pose App

## Visão Geral

**Fisio Pose App** é um aplicativo mobile desenvolvido em **Flutter** com o objetivo de realizar **detecção de pose humana em tempo real** utilizando a câmera do dispositivo.

A aplicação utiliza **visão computacional** para identificar pontos corporais (landmarks) do usuário, permitindo analisar movimentos, posturas e execução de exercícios físicos.

O sistema captura frames da câmera, envia para processamento com **MediaPipe Pose**, e desenha um **esqueleto digital (skeleton overlay)** sobre a imagem, possibilitando análise visual e futura mensuração de exercícios fisioterapêuticos e atividades físicas.

Este projeto serve como base para futuras aplicações de:

* fisioterapia digital
* personal trainer virtual
* análise biomecânica
* contagem automática de exercícios
* reabilitação motora

---

```markdown
Fisio Pose App
──────────────

[ CAMERA ]
📷 Captura em tempo real

[ POSE DETECTION ]
🧍 33 landmarks detectados

[ SKELETON OVERLAY ]
Linhas e pontos desenhados na tela

[ FUTURO ]
Contagem automática de exercícios
Análise de postura
Relatórios de movimento
```

---

## Evidências de uso da aplicação

Resultado Final aplicação pronta:

Home Page

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/ce9d752a-898d-47f5-a902-a2a5e7e9fc80" />

Exercício de Prancha correto

<img width="1917" height="1080" alt="image" src="https://github.com/user-attachments/assets/7163e3e5-4171-45c6-8efd-16d526c49799" />

Exercício de Prancha incorreto

<img width="1913" height="1080" alt="image" src="https://github.com/user-attachments/assets/4ad0345a-634a-4e00-b160-75c7a35d1c31" />

Vídeo teste de uso do app

https://github.com/user-attachments/assets/b660443d-aa2c-46f7-86fa-d22f122feff5

---

## Exercícios já suportados

Com a infraestrutura atual de detecção de pose e análise de landmarks já implementada, o aplicativo já possui base técnica para monitoramento de exercícios fundamentais de fisioterapia e fitness.

Os exercícios abaixo servem como **prova de conceito funcional** do sistema de análise de movimento em tempo real.

---

## Agachamento (Squat)

O aplicativo já possui todos os pontos necessários para análise do movimento de agachamento.

Landmarks utilizados:

* quadril (hip)
* joelho (knee)
* tornozelo (ankle)

A partir desses pontos é possível calcular o **ângulo do joelho**, permitindo identificar:

* fase de descida
* fase de subida
* profundidade do movimento
* ciclo completo do exercício

Essa base já permite a futura implementação de **contagem automática de repetições**.

---

## Flexão de braço (Push-up)

O sistema também permite análise do movimento de flexão utilizando os pontos:

* ombro (shoulder)
* cotovelo (elbow)
* punho (wrist)
* quadril (hip)

Com esses landmarks é possível identificar:

* extensão e flexão do braço
* descida e subida do tronco
* alinhamento corporal durante o exercício

Essa análise já possibilita a futura contagem automática de repetições e validação de execução correta.

---

## Prancha (Plank)

Além de exercícios dinâmicos, o sistema também suporta análise de **postura estática**.

Utilizando os pontos:

* ombro
* quadril
* tornozelo

O aplicativo consegue verificar o **alinhamento corporal**, permitindo identificar:

* quadril elevado ou baixo
* perda de alinhamento do tronco
* manutenção de postura correta ao longo do tempo

Essa funcionalidade é essencial para aplicações de fisioterapia e reabilitação.

---

## Extensibilidade do sistema

A arquitetura do Fisio Pose App foi projetada para permitir a criação e adição de novos exercícios de forma simples e escalável.

Qualquer exercício baseado em movimento corporal pode ser implementado utilizando:

* cálculo de ângulos articulares
* análise de alinhamento corporal
* detecção de ciclos de movimento
* avaliação de postura

Exemplos de exercícios que podem ser adicionados futuramente:

* polichinelos
* elevação lateral de braços
* corrida estacionária
* abdominal
* avanço (lunge)
* elevação de joelho
* exercícios de reabilitação específicos

Essa flexibilidade permite evolução contínua do aplicativo para cenários de:

* fisioterapia digital
* personal trainer virtual
* reabilitação motora
* análise biomecânica
* fitness inteligente

---

# Plataforma

O **Fisio Pose App** foi desenvolvido com **Flutter**, permitindo que toda a interface, lógica de negócio e arquitetura do sistema sejam compartilhadas entre plataformas.

Atualmente, a detecção de pose em tempo real está **implementada e otimizada para Android**, utilizando integração nativa com o **MediaPipe Tasks Vision (Kotlin)**.

A arquitetura do projeto foi planejada desde o início para suportar múltiplas plataformas, permitindo expansão futura para:

* iOS (Swift + MediaPipe)
* Web (MediaPipe JS / WASM)

Essa abordagem **Android-first** permite validar o produto rapidamente, mantendo a base preparada para evolução multiplataforma sem reescrever o app.

---

## Aplicações Mobile

### Android (implementado)

O aplicativo roda nativamente em smartphones Android, utilizando:

* câmera em tempo real
* processamento contínuo de frames
* MediaPipe Pose via código nativo (Kotlin)
* renderização do esqueleto em Flutter

Esta é a **plataforma principal de desenvolvimento e validação do produto**.

---

### iOS (planejado)

A arquitetura já prevê suporte ao iOS através de:

* integração Swift com MediaPipe Tasks
* reutilização total da UI Flutter
* reutilização da lógica de análise de movimento

Nenhuma parte da aplicação precisará ser reescrita — apenas a camada nativa será adicionada.

---

## Vantagens do uso do Flutter

Mesmo com a detecção de pose implementada inicialmente apenas no Android, o uso do Flutter traz benefícios imediatos:

* UI única e reutilizável entre plataformas
* arquitetura pronta para expansão
* manutenção centralizada
* alta produtividade de desenvolvimento
* consistência visual em todos os dispositivos

A camada nativa de visão computacional é **plugável**, permitindo adicionar novas plataformas sem impactar a interface ou a lógica principal do app.

---

## Escalabilidade Tecnológica

O projeto pode evoluir para:

* painéis de monitoramento em clínicas
* integração com wearables
* sistemas de acompanhamento remoto
* dashboards administrativos

---

# Roadmap Multiplataforma

O projeto segue uma estratégia **progressiva de expansão de plataforma**.

### Fase atual — Android First

✔ Integração completa com MediaPipe Pose
✔ Pipeline de visão computacional em tempo real
✔ Skeleton overlay funcional

### Próxima fase — iOS

Planejado:

* integração MediaPipe Tasks Vision em Swift
* adaptação da camada MethodChannel
* validação de performance em dispositivos Apple

### Fase futura — Web

Planejado:

* MediaPipe Web (JavaScript / WASM)
* execução diretamente no navegador
* uso em clínicas e dashboards

---

# Funcionalidades

## Detecção de pose em tempo real

O sistema identifica automaticamente **33 pontos corporais** utilizando MediaPipe Pose.

Entre os pontos detectados:

* cabeça
* ombros
* cotovelos
* punhos
* quadris
* joelhos
* tornozelos

---

## Skeleton Overlay

O aplicativo desenha:

* pontos articulares
* conexões entre membros
* estrutura completa do esqueleto humano

Diretamente sobre a imagem da câmera.

---

## Processamento contínuo de frames

Pipeline de processamento:

```
Camera → JPEG → Native (MediaPipe) → Flutter → Renderização
```

---

## Base para contagem de exercícios

A arquitetura já permite futura implementação de:

* contagem de repetições
* análise de postura
* validação de movimento correto
* feedback visual em tempo real

---

# Arquitetura do Sistema

A aplicação utiliza arquitetura modular baseada em separação de responsabilidades.

```
UI (Camera / Overlay)
        ↓
Controllers
        ↓
Services (PoseService)
        ↓
Native Layer (Android - implementado / iOS - planejado)
        ↓
MediaPipe Pose
```

---

## Camadas

### UI (Interface)

Responsável por:

* preview da câmera
* desenho do esqueleto
* feedback visual

---

### Controllers

Gerenciam:

* processamento de frames
* fluxo da aplicação
* estado da detecção

---

### Services

Exemplo:

```
PoseService
- envia frame para código nativo
- recebe landmarks
- converte dados para Dart
```

---

### Camada Nativa

Implementada em:

* Kotlin (Android) ✔
* Swift (iOS) — planejado

Responsável por executar o **MediaPipe Tasks Vision**.

---

# Tecnologias Utilizadas

## Flutter

Framework multiplataforma de alto desempenho.

Vantagens:

* UI moderna
* alto desempenho
* base única de código
* rápida evolução de produto

---

## Dart

Linguagem principal do projeto.

Características:

* tipagem forte
* programação assíncrona
* compilação AOT/JIT

---

## MediaPipe Pose

Biblioteca de visão computacional do Google para detecção de pose humana em tempo real.

---

## MethodChannel

Comunicação entre Flutter e código nativo.

```
Flutter → MethodChannel → Kotlin → MediaPipe → Flutter
```

---

# Instalação do Projeto

## Requisitos

* Flutter SDK
* Dart SDK
* Android Studio ou VS Code
* Dispositivo Android com câmera

Verifique o Flutter:

```
flutter doctor
```

---

## Clonando o projeto

```
git clone https://github.com/seu-repo/fisio_pose_app
cd fisio_pose_app
```

---

## Instalar dependências

```
flutter pub get
```

---

## Executar o projeto

Modo debug:

```
flutter run
```

Build Android:

```
flutter build apk
```

---

# Estrutura do Projeto

```
lib/
 ├── camera/
 ├── pose/
 │    ├── pose_service.dart
 │    ├── pose_analyzer.dart
 │
 ├── ui/
 │    ├── camera_page.dart
 │    ├── pose_painter.dart
 │
 └── main.dart
```

---

# Visão Computacional

O sistema utiliza conceitos de:

* processamento de imagem
* detecção de landmarks
* análise geométrica de movimento
* reconstrução de esqueleto humano

Os landmarks são recebidos como:

```
List<double>
[x1, y1, z1, x2, y2, z2 ...]
```

Total: **33 pontos × 3 coordenadas**

---

# Escalabilidade

Possíveis evoluções:

* análise automática de exercícios (agachamento, flexão, prancha)
* detecção de postura incorreta
* relatórios de desempenho
* integração com IA
* armazenamento de sessões
* telemedicina

---

# Melhorias Futuras

### Contador automático de repetições

Identificação de ciclos de movimento usando ângulos articulares.

### Avaliação de postura

Detecção de desalinhamentos corporais.

### Relatórios de sessão

Métricas de desempenho:

* tempo de exercício
* repetições
* qualidade do movimento

### Fisioterapia remota

Monitoramento por profissionais de saúde.

---

# Conclusão

O **Fisio Pose App** demonstra a aplicação prática de:

* Flutter como base multiplataforma
* visão computacional em tempo real
* integração Flutter + código nativo (Android)
* processamento de movimento humano

O projeto segue uma estratégia **Android-first**, validando tecnologia e experiência do usuário enquanto mantém a arquitetura preparada para expansão futura para iOS e Web.

Essa base tecnológica permite evoluir o produto para soluções profissionais de:

* fisioterapia digital
* fitness inteligente
* reabilitação motora
* análise biomecânica 💪
