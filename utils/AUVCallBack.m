classdef AUVCallBack

    methods(Static)

        % Use the code browser on the left to add the callbacks.


        function Hy(callbackContext)
            MaskObj = Simulink.Mask.get(gcbh);

            hydroPopup = MaskObj.getParameter('Hy');
            simple_coeff = MaskObj.getDialogControl('Container6');
            complex_coeff = MaskObj.getDialogControl('Container7');
            
            if strcmp(hydroPopup.Value, 'Simple')
                simple_coeff.Visible = 'on';
                complex_coeff.Visible = 'off';
            elseif strcmp(hydroPopup.Value, 'Complex')
                simple_coeff.Visible = 'off';
                complex_coeff.Visible = 'on';
            end
            
        end

        

        function w_current(callbackContext)
            MaskObj = Simulink.Mask.get(gcbh);
            currentPopup = MaskObj.getParameter('w_current');
            customCurrent = MaskObj.getParameter('waterCurrent');
            maskVars = MaskObj.getWorkspaceVariables();
            allNames = {maskVars.Name};
            index = strcmp(allNames, 'waterCurrent');

            if strcmp(currentPopup.Value, 'Custom')
                customCurrent.Visible = 'on';
            else
                customCurrent.Visible = 'off';
            end

            if strcmp(currentPopup.Value, 'Random')
                currentVelocity = getCurrentVelocity();
                maskVars(index).Value = currentVelocity;
                set_param(gcb,"waterCurrent","["+num2str(currentVelocity')+"]");
            elseif strcmp(currentPopup.Value, 'None')
                maskVars(index).Value = [0 0 0];
                set_param(gcb,"waterCurrent","[0 0 0]")
            else
                 maskVars(index).Value = customCurrent.Value;
            end
            
        end
    end
end