# AGENTS.md

## Visão geral

Este repositório é um mod do Factorio que adiciona a trilha sonora de Workers & Resources: Soviet Republic como música ambiente e de menu. O projeto é pequeno, mas depende fortemente de assets de áudio e de uma biblioteca compartilhada do mod (`LDA-LIB`).

A estrutura principal é simples e direta:

- `info.json`: metadados do mod (nome, versão, autor, dependências, compatibilidade com Factorio, licença e thumbnail).
- `data.lua`: ponto principal de registro. Define as configurações de startup e chama `LDAUtils.CreateInterludeAmbientSound(...)` e `CreateMenuAmbientSound(...)` para registrar as faixas.
- `settings.lua`: configurações visíveis ao usuário para ativar/desativar música ambiente e música do menu.
- `audio/`: arquivos `.ogg` e o script de carregamento do áudio (`muisc-loader.lua`).
- `locale/en` e `locale/pt-BR`: textos das opções do mod.
- `docs/factorio-LDA-LIB/`: documentação da biblioteca compartilhada que o mod usa. Quando houver dúvida sobre APIs de Factorio ou convenções de integração, essa pasta é a referência principal.

Os ZIPs na raiz do projeto são artefatos de release e não devem ser tratados como fonte de verdade.

## Build, validação e comandos relevantes

Não há pipeline de build/test/lint em Node, Python ou Lua para este repositório. A validação prática é feita principalmente por empacotamento e por carregar o mod no Factorio.

### Comando principal de empacotamento

- `autoupdate.cmd`

Esse script:

- lê `name` e `version` de `info.json`
- carrega variáveis do `.env`, incluindo `API_KEY`
- cria um ZIP do mod no diretório atual
- copia o ZIP para a pasta de mods do Steam do Factorio (`Z:\SteamLibrary\steamapps\common\Factorio\mods`)
- falha cedo se `API_KEY` não estiver definido ou se `info.json` estiver inconsistente

### Verificações rápidas de sintaxe Lua

Use essas checagens rápidas quando for alterar scripts Lua:

- `lua -e "assert(loadfile([[data.lua]]))"`
- `lua -e "assert(loadfile([[audio\muisc-loader.lua]]))"`

### Validação no jogo

Para verificar mudanças reais, carregue o mod no Factorio e confirme que:

- a música do menu funciona;
- a música ambiente funciona;
- as configurações do mod continuam aparecendo corretamente;
- os nomes de arquivos e os caminhos de áudio continuam consistentes.

## Arquitetura de alto nível

Este projeto não segue uma aplicação grande com camadas múltiplas; a arquitetura é direta e baseada em modding de Factorio:

1. `info.json` define o pacote do mod.
2. `data.lua` registra protótipos e sons usando `LDA-LIB`.
3. `settings.lua` expõe toggles de startup.
4. `audio/` armazena os arquivos de música.
5. `locale/*` define textos dependentes de idioma.
6. `docs/factorio-LDA-LIB/` representa a API externa usada pelo mod, não um subprojeto do repo que deva ser reimplementado.

Mantenha essa separação: a lógica principal do mod é concentrada em arquivos raiz e em assets de áudio, e não em camadas extra de framework.

## Convenções e padrões importantes

- O arquivo `info.json` deve permanecer consistente com o comportamento real do mod. Se a versão mudar, o metadata do mod também deve mudar.
- A integração com a biblioteca compartilhada segue o padrão:

  ```lua
  local LDA = require("__LDA-LIB__/init")
  local PATH = LDA.setBasePath("Workers-And-Resources-Soviet-Republic-OST")
  ```

- Os caminhos dos arquivos de áudio são parte do contrato. No `data.lua`, cada faixa é referenciada por `folderMusic .. "..."`; se o nome do arquivo for alterado, a referência também deve ser ajustada.
- Os IDs de configuração de startup são estáveis e devem ser preservados:
  - `Workers-And-Resources-Soviet-Republic-OST_ambient_music_config`
  - `Workers-And-Resources-Soviet-Republic-OST_music_menu_config`
- Sempre mantenha `locale/en` e `locale/pt-BR` sincronizados quando alterar nomes ou descrições das configurações.
- A dependência declarada no projeto é `Factorio 2.1` com `LDA-LIB >= 0.0.17`; as mudanças devem respeitar essa API a menos que haja uma intenção explícita de atualizar dependência e compatibilidade.
- Prefira alterações pequenas e diretas em `data.lua`, `settings.lua`, `audio/*`, `locale/*` e `info.json` em vez de criar camadas novas ou infraestruturas artificiais.

## Regras de modificação

- Priorize a edição dos arquivos de origem do mod em vez de editar ZIPs gerados.
- Ao adicionar ou remover faixas, mantenha o padrão de nomes e a estrutura de pastas compatível com os registradores usados por `LDAUtils`.
- Se alterar opções visíveis ao usuário, atualize os textos em ambos os idiomas.
- Não invente build systems, package managers ou pipelines extras para este repositório; o fluxo de release atual é o `autoupdate.cmd`.

## Regra obrigatoria: usar a LDA-LIB

Antes de implementar uma funcao utilitaria ou um padrao reutilizavel:

1. Verifique se a LDA-LIB ja oferece a funcionalidade.
2. Consulte a API e os exemplos da copia em `docs/factorio-LDA-LIB/`, incluindo `README.md`, `USAGE.md` e os modulos relevantes.
3. Confirme a assinatura e a disponibilidade da funcao na versao minima da biblioteca exigida em `info.json`.
4. Se a funcionalidade existir, use a LDA-LIB em vez de criar uma implementacao local duplicada.

A copia em `docs/factorio-LDA-LIB/` e somente para leitura e informacao: nao a edite, nao a use como destino de correcoes e nao trate alteracoes nela como contribuicoes oficiais a LDA-LIB. O mod deve continuar consumindo a biblioteca como dependencia, conforme sua integracao existente.

### Quando a funcao necessaria nao existir na LDA-LIB

- Informe claramente ao usuario que a funcionalidade e uma **request feature to LDA-LIB**, descrevendo a funcao necessaria e seu objetivo. Nao afirme que a solicitacao foi enviada se isso nao aconteceu.
- Registre cada funcionalidade que precisa ser requisitada em `request-feature.md`, seguindo o formato definido nesse arquivo. Atualize o registro em vez de criar listas paralelas em outros arquivos.
- Enquanto a funcao nao estiver oficialmente disponivel, implemente somente o helper necessario dentro de `utils/` neste projeto.
- Mantenha essa implementacao local pequena, documentada quando necessario e isolada para facilitar sua substituicao. Nao altere a copia em `docs/` nem finja que o helper ja faz parte da biblioteca.
- Quando a funcionalidade for incorporada oficialmente e estiver disponivel na versao compativel, migre os usos para a LDA-LIB e remova o helper temporario se ele nao tiver outros consumidores.

## Resumo

Este projeto é um mod Factorio simples e orientado a assets. A maior parte do conhecimento relevante está em `info.json`, `data.lua`, `settings.lua`, `audio/` e na documentação da `LDA-LIB` em `docs/factorio-LDA-LIB/`. Siga esse padrão ao alterar música, configurações ou metadados do mod.
