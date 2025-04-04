module WorkflowsHelper
  def button_to_set_stage(bubble, stage)
    button_to bucket_bubble_stagings_path(bubble.bucket, bubble, stage_id: stage),
      method: :post, class: [ "btn full-width justify-start workflow-stage txt-uppercase", { "workflow-stage--current": stage == bubble.stage } ],
      form_class: "flex align-center gap-half",
      data: { turbo_frame: "_top" } do
        tag.span class: "overflow-ellipsis" do
          stage.name
        end
      end
  end
end
