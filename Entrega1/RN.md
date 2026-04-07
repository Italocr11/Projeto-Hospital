# Regras de Negócios 
### Sistema de Gestão Hospitalar<br>
Este documento apresenta as regras de negócios do sistema de gestão hospitalar, descrevendo como os dados estão ligados entre si, gerando restrições.


`RN01` - **Alocação de Leitos**<br>
Um paciente só pode ser alocado em leitos cujo status seja Disponível. Ao ser alocado, o status do leito deve ser alterado para Ocupado.

`RN02` - **Responsabilidade Médica**<br>
Toda internação deve possuir, obrigatoriamente, ao menos um médico assistente (responsável) vinculado durante todo o período de permanência.

`RN03` - **Rastreabilidade de Medicamentos**<br>
Medicamentos só podem ser administrados mediante o registro de uma prescrição médica vinculada à internação ou consulta do paciente.

`RN04` - **Reintervenção Cirúrgica**<br>
Cirurgias que precisam ser refeitas devem ser registradas como um novo procedimento do tipo Reintervenção, mantendo obrigatoriamente um vínculo com o ID da cirurgia original.

`RN05` - **Agendamento de Bloco Cirúrgico**<br>
Uma cirurgia só pode ser confirmada se houver a disponibilidade simultânea de: data, sala cirúrgica, médico responsável e paciente.

`RN06` - **Menores de Idade**<br>
Pacientes com idade inferior a 18 anos não podem ter o cadastro finalizado sem a vinculação de pelo menos um responsável legal (pai, mãe ou tutor).

`RN07` - **Escala de Plantão**<br>
O sistema não deve permitir o registro de atendimentos por médicos que não estejam escalados no plantão vigente da unidade/setor.

`RN08` - **Vínculo de Atendimento**<br>
Todo agendamento de consulta deve ser associado a um único médico e um único paciente em um horário específico, impedindo choques de agenda.

`RN09` - **Hierarquia de Setores**<br>
Todo funcionário e médico deve estar obrigatoriamente vinculado a um setor ativo para exercer atividades no sistema.

`RN10` - **Alta**<br>
A alta hospitalar só pode ser registrada no sistema após a baixa de todas as prescrições pendentes e a validação do médico responsável.

`RN11` - **Exame**<br>
O resultado de um exame só pode ser visualizado pelo paciente e por médicos vinculados ao seu histórico de atendimento.

`RN12` - **Convênio**<br>
Todo procedimento vinculado a convênio deve passar por uma verificação de elegibilidade (autorização) antes da realização, exceto em casos de urgência/emergência.

`RN13` - **Vínculo Médico e Setor**<br>
Médicos só podem realizar prescrições ou evoluções para pacientes alocados em setores onde o médico possua vínculo ou permissão de acesso.

`RN14` - **Alerta de Alergias**<br>
O sistema deve emitir um alerta impeditivo caso um médico prescreva um medicamento que contenha substâncias listadas no campo de "Alergias" do prontuário do paciente.

`RN15` - **Triagem Obrigatória**<br>
Em atendimentos de urgência/emergência, o paciente deve passar obrigatoriamente pela triagem (Classificação de Risco) antes de ser encaminhado ao médico.
