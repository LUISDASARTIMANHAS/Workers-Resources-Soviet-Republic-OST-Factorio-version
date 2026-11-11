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

### Opcoes de superficie para CreateInterludeAmbientSound (shared.control-utils)

- **Status:** Pendente de envio
- **Tipo:** Melhoria de funcao existente
- **Estagio do Factorio:** data-stage
- **Mod / Projeto Solicitante:** Workers-And-Resources-Soviet-Republic-OST v0.0.6
- **Funcao/API solicitada:** permitir informar `play_on_all_surfaces` ou `planets` na criacao de uma faixa interlude e gerar propriedades compativeis com Factorio 2.1.
- **Necessidade no mod:** No Factorio 2.1, faixas sem `planets` ou `surface_names` ficam restritas a plataformas e ao mapa espacial. O mod precisa continuar tocando em todas as superficies; a propriedade antiga `planetoptional` nao expressa essa regra.
- **Exemplo de uso desejado:**
  ```lua
  LDA.utils.CreateInterludeAmbientSound(nameTrack, volume, {
      play_on_all_surfaces = true
  })
  ```
- **Comportamento em casos limite:** nao combinar `play_on_all_surfaces` com `planets` ou `surface_names`; converter um planeta opcional para `planets = { planetId }`.
- **Frequencia de execucao:** sob demanda, durante o data-stage.
- **Implementacao temporaria:** `utils/ambient-sound.lua` adapta o prototipo da LDA-LIB, remove `planetoptional` e define `play_on_all_surfaces = true` quando nenhum planeta e especificado.
- **Compatibilidade:** Factorio 2.1; LDA-LIB >= 0.0.17; Space Age opcional.