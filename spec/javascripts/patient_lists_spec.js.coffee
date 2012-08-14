describe "MembershipController", ->
  subj = new _test.MembershipController

  beforeEach ->
    spyOn(subj, 'create').andCallThrough()
    spyOn(subj, 'onError').andCallThrough()
    spyOn(window, 'alert').andCallThrough()

  it "receives a dropped patient helper and calls @create", ->
    spyOn(subj, 'receiveDrop').andCallThrough()
    spyOn($, 'ajax').andReturn(true)

    subj.receiveDrop( '<div data-patient-list-id="1"></div>', '<div data-patient-id="123">')
    expect(subj.create).toHaveBeenCalled()

  it "calls @onSuccess when it's sucessful", ->
    spyOn(subj, 'onSuccess')
    spyOn($, 'ajax').andCallFake((params)->
      params.success()
    )
    subj.create(1, 123);
    expect($.ajax).toHaveBeenCalled()
    expect(subj.onSuccess).toHaveBeenCalled()

  it "warns when the relationship already exists", ->
    spyOn($, 'ajax').andCallFake((params) ->
      params.error({responseText: 'Patient is already on list'})
    )
    subj.create(1, 123)
    expect(subj.onError).toHaveBeenCalled()
    expect(window.alert).toHaveBeenCalledWith("Patient is already on the list")

  it "gives an error when the relationship cannot be created", ->
    spyOn($, 'ajax').andCallFake((params) ->
      params.error({responseText: ''})
    )
    subj.create(1, 123)
    expect(window.alert).toHaveBeenCalledWith("Could not add patient to list")
