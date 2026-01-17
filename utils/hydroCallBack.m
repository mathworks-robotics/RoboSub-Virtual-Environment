classdef hydroCallBack

    methods(Static)

        % Use the code browser on the left to add the callbacks.


        function Hy(callbackContext)

            MaskObj = Simulink.Mask.get(gcbh);

            hydroPopup = MaskObj.getParameter('Hy');
            simple_coeff = MaskObj.getDialogControl('Container5');
            complex_coeff = MaskObj.getDialogControl('Container6');
            
            if strcmp(hydroPopup.Value, 'Simple')
                simple_coeff.Visible = 'on';
                complex_coeff.Visible = 'off';
            elseif strcmp(hydroPopup.Value, 'Complex')
                simple_coeff.Visible = 'off';
                complex_coeff.Visible = 'on';
            end
            

        end

    end
end