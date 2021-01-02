module FormTaskHelper
  def call_reply_on_form_task(exid, expected_current_nid)
    form_task = Floristry::Web::FormTask.find("#{exid}!#{expected_current_nid}")
    form_task.update_attributes({free_text: 'Testati testato'})
    form_task.reply

    form_task
  end
end
