# Solicitacoes de funcionalidades para a LDA-LIB

Use este arquivo como registro central de todas as funcionalidades que precisem ser requisitadas a LDA-LIB.

## Regras

- Antes de abrir um pedido, confirme que a funcao ou funcionalidade nao existe na versao compativel da LDA-LIB. Consulte `docs/factorio-LDA-LIB/`, que e somente para leitura.
- Registre aqui cada necessidade identificada, incluindo o objetivo e o uso neste mod. Nao mantenha listas duplicadas em outros arquivos.
- Informe o usuario sobre a necessidade da **request feature to LDA-LIB** e sobre a implementacao temporaria local em `utils/`.
- Use `Pendente de envio` ate que o pedido tenha sido realmente enviado. So marque como `Solicitada` quando houver evidencia de envio; nao afirme que um pedido foi enviado sem realiza-lo.
- Quando a funcionalidade estiver oficialmente disponivel em uma versao compativel, atualize o status para `Disponivel`, registre a versao e migre o mod para a API oficial.
- Nao registre como pedido uma funcionalidade que ja exista na biblioteca ou que nao seja necessaria para este projeto.

## Modelo de registro

Copie este modelo para cada nova solicitacao:

[TÍTULO DO RECURSO OU MODIFICAÇÃO] (modulo.sugerido)
Tipo de Solicitação: [ ] Nova Feature / API [ ] Melhoria de Função Existente [ ] Bugfix / Correção [ ] Otimização
Status: Pendente de envio
Estagio do Factorio: [ ] data-stage (data.lua) [ ] runtime (control.lua) [ ] settings (settings.lua)
Mod / Projeto Solicitante: [Nome do seu mod e versão, ex: Quantum-Teleporter v1.0.0]

Funcao/API Solicitada:
Nome e assinatura da função desejada (ex: LDARuntime.gui.findElementByName(root_element, name, max_depth)).

Parametros e Tipos:
- parametro_1 (tipo, obrigatorio/opcional): Descricao do dado esperado.
- parametro_2 (tipo, opcional): Descricao e valor padrao caso omitido.

Retorno Esperado:
Tipo e formato do retorno (ex: LuaGuiElement|nil, tabela de protótipo, booleano de sucesso, etc.).

Necessidade no Mod (Caso de Uso):
Qual mecânica o seu mod precisa implementar e qual dor de cabeça isso resolve (evitar código duplicado, janelas complexas, cálculos manuais, etc.).

Exemplo de Uso Pratico:
Como você gostaria de chamar essa função no seu código final:
-- exemplo:
local resultado = LDARuntime.modulo.funcao(...)

Comportamento em Casos Limite (Edge Cases & Falhas):
O que deve acontecer se o elemento for inválido, faltar energia, objeto for destruído ou valores forem nulos (ex: "retornar nil em vez de dar crash", "não gastar energia se não cobrir o total").

Frequencia de Execucao (Performance):
[ ] Sob demanda (eventos de clique, construção, abertura de GUI)
[ ] Frequente (chamado em on_tick, loops ou varreduras em massa)

Implementacao Temporaria (Workaround Atual):
Cole o código ou helper que você criou temporariamente no seu mod para servir de inspiração:
-- cole o código aqui

Compatibilidade & Dependencias:
- Factorio: 2.0+ / 2.1+
- LDA-LIB: >= 0.0.17
- DLC Space Age: [ ] Obrigatorio [ ] Opcional [ ] Nao aplicavel

Observacoes Tecnicas:
Detalhes específicos de engine (ex: "objetos Factorio são userdata", "persistir em storage", "respeitar player.opened para fechar no ESC").

---

## Solicitacoes Registradas

### Aceitar objetos LuaPlayer e LuaSurface nos resolvers do Runtime

- **Status:** Disponivel (LDA-LIB v0.0.17)
- **Funcao/API solicitada:** Corrigir `runtime/modules/player.get` e `runtime/modules/world.getSurface` para reconhecer objetos Factorio `LuaPlayer` e `LuaSurface` validos sem exigir `type(value) == "table"`. Para um objeto com `.valid`, os resolvers devem aceita-lo diretamente; nomes, indices e `nil` devem continuar funcionando como atualmente.
- **Necessidade no mod:** A versao 0.0.16 rejeitava os objetos Lua do Factorio nos testes `type(player_or_id) == "table"` e `type(surface_or_id) == "table"`.
- **Estagio do Factorio:** runtime
- **Uso no projeto:** Todo o runtime (`control.lua`, `control/functions.lua`, `control/handle.lua`, `control/portal.lua`, `control/gui/portal-gui.lua`)
- **Implementacao oficial:** Incorporado na LDA-LIB v0.0.17 com verificação `pcall(function() return target.valid end)`. Helper temporário `control/utils/lda-runtime.lua` removido.
- **Compatibilidade:** LDA-LIB >= 0.0.17, Factorio 2.1+

### Builder de Prototipo de Acumulador (createAccumulator)

- **Status:** Disponivel (LDA-LIB v0.0.17)
- **Funcao/API solicitada:** `LDA.createAccumulator(params)` (em `data-stage.builders.base.create-accumulator` e exportada via `init.lua`). Constrói protótipo `type = "accumulator"` modular aceitando nome, ícone, tamanho de colisão/seleção via bounding box, capacidade do buffer elétrico, limites de fluxo de entrada e saída (`input_flow_limit`, `output_flow_limit`), gráficos estáticos ou carregáveis (`chargable_graphics`), sons de operação e resistências.
- **Necessidade no mod:** O Portal Quântico precisa ser uma estrutura de armazenamento de energia (acumulador) para conectar-se à rede elétrica e acumular energia de teletransporte sem apresentar janelas de montagem/receitas.
- **Estagio do Factorio:** data-stage
- **Uso no projeto:** `data/blocos/quantum-teleporter-portal.lua`
- **Implementacao oficial:** Incorporado na LDA-LIB v0.0.17 via `LDAFunctions.createAccumulator`. Helper local `functions.createAccumulator` removido de `data/utils.lua`.
- **Compatibilidade:** LDA-LIB >= 0.0.17, Factorio 2.1+

### Modulo de Rede de Entidades (runtime.modules.network)

- **Status:** Disponivel (LDA-LIB v0.0.17)
- **Funcao/API solicitada:** `LDARuntime.network` (com funções como `register(network_name, entity, metadata)`, `unregister(network_name, entity_or_id)`, `getAll(network_name, force_name)`, `get(network_name, unit_number)`, `setName(network_name, unit_number, name)` e `findFreeSpawnPosition(entity, target_name, radius)`).
- **Necessidade no mod:** O sistema de portais interligados precisa registrar e persistir em `storage` todos os portais existentes no universo, rastrear adições/remoções por robôs ou jogadores, validar a validade das entidades (`entity.valid`), e permitir consultas filtradas por força/time e superfície para montar rotas de teletransporte.
- **Estagio do Factorio:** runtime
- **Uso no projeto:** `control/portal.lua`, `control/gui/portal-gui.lua`
- **Implementacao oficial:** Incorporado na LDA-LIB v0.0.17 via `LDARuntime.network`. Helper local `control/utils/portal-network.lua` removido.
- **Compatibilidade:** LDA-LIB >= 0.0.17, Factorio 2.1+

### Helpers de Interface Grafica (runtime.modules.gui)

- **Status:** Disponivel (LDA-LIB v0.0.17)
- **Funcao/API solicitada:** `LDARuntime.gui` (funções auxiliares para GUI de mods, como `findElementByName(root_element, name)` para busca recursiva segura em hierarquias complexas de containers, padronização de criação de janelas modais vinculadas a `player.opened` com botão fechar no titlebar, e formatação/criação de barras de status de energia).
- **Necessidade no mod:** As janelas do Portal e do Equipamento possuem layouts estruturados com múltiplos fluxos aninhados (`flows`, `frames`). A busca recursiva de elementos e a formatação uniforme de Joules/Watts evitam duplicação de código.
- **Estagio do Factorio:** runtime
- **Uso no projeto:** `control/gui/portal-gui.lua`
- **Implementacao oficial:** Incorporado na LDA-LIB v0.0.17 via `LDARuntime.gui` (`findElementByName`, `formatEnergy`, `closeWindow`, etc.).
- **Compatibilidade:** LDA-LIB >= 0.0.17, Factorio 2.1+

### Correcao de Colisao no Registro de Comandos do Runtime (runtime.commands / runtime.init)

- **Status:** Disponivel (LDA-LIB v0.0.17)
- **Funcao/API solicitada:** Proteção contra registro duplicado em `commands.register()` e isolamento do ponto de entrada do runtime quando consumido por outros mods.
- **Necessidade no mod:** Evitar erro fatal `A script command already exists with the name: lda-list` ao fazer `require("__LDA-LIB__/runtime.init")`.
- **Estagio do Factorio:** runtime
- **Uso no projeto:** Todo o runtime (`control.lua`, `control/functions.lua`, `control/handle.lua`, `control/portal.lua`, `control/gui/portal-gui.lua`)
- **Implementacao oficial:** Corrigido na LDA-LIB v0.0.17 com `if is_own_mod then ... commands.register() end`. Todos os arquivos agora importam `__LDA-LIB__/runtime.init` diretamente.
- **Compatibilidade:** LDA-LIB >= 0.0.17, Factorio 2.1+

### Helpers de Grade de Equipamento e Energia (runtime.modules.equipment_grid)

- **Status:** Disponivel (LDA-LIB v0.0.17)
- **Funcao/API solicitada:** `LDARuntime.equipment_grid` com funções como `getEnergy(grid)` e `drainEnergy(grid, amount_in_joules)`. No Factorio, `LuaEquipmentGrid` não possui método nativo `drain_energy`; a energia reside em cada `LuaEquipment.energy` individual.
- **Necessidade no mod:** O teleporte pelo equipamento pessoal na armadura precisa ler a carga total disponível na grade e drenar uma cota de Joules de forma distribuída entre as baterias e equipamentos da armadura.
- **Estagio do Factorio:** runtime
- **Uso no projeto:** `control/handle.lua`
- **Implementacao oficial:** Incorporado na LDA-LIB v0.0.17 via `LDARuntime.equipment_grid.getEnergy` e `LDARuntime.equipment_grid.drainEnergy`. Helpers locais em `control/handle.lua` removidos.
- **Compatibilidade:** LDA-LIB >= 0.0.17, Factorio 2.1+
