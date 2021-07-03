using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;

public class ObjControl : MonoBehaviour
{
    public Transform _TargetOBjTran;

    public ARTrackedImageManager _TrackImgMng;

    private void OnEnable() {
        //������Ʈ�� ����ɶ� �̹���Ʈ��ŷ �̺�Ʈ���...
        if (_TrackImgMng != null)
            _TrackImgMng.trackedImagesChanged += ARTrackingImgChange;
    }

    private void OnDisable() {
        //������Ʈ�� ����ɶ� �̹���Ʈ��ŷ �̺�Ʈ����...
        if (_TrackImgMng != null)
            _TrackImgMng.trackedImagesChanged -= ARTrackingImgChange;
    }

    //�׽�Ʈ ��ư �����....
    private void OnGUI() {
        //��ư�� ������, y�� 0.1(10cm)�̵�.
        if (GUI.Button(new Rect(10, 10, 100,50),"move")) {
            _TargetOBjTran.position = new Vector3(0f, _TargetOBjTran.position.y + 0.1f, 0f);
        }

        //��ư�� ������ ���������� ȸ���� ��Ų��.
        if (GUI.Button(new Rect(10, 70, 100, 50), "rotation")) {
            StartCoroutine(co_Rotation());
        }

        //������Ʈ�� ����....
        if (GUI.Button(new Rect(10, 130, 100, 50), "reset")) {

            StopAllCoroutines();

            _TargetOBjTran.position = Vector3.zero;
            _TargetOBjTran.rotation = Quaternion.Euler(0f, 0f, 0f);
        }
    }

    private void ARTrackingImgChange(ARTrackedImagesChangedEventArgs events) {

        Debug.Log("ImgEvent Active");
        List<ARTrackedImage> addedImages = events.added;
        List<ARTrackedImage> removedImages = events.removed;
    }

    IEnumerator co_Rotation() {

        yield return null;

        while(true) {
            yield return new WaitForSeconds(0.1f);

            Vector3 rotation = _TargetOBjTran.rotation.eulerAngles;

            rotation = new Vector3(rotation.x + 1, rotation.y + 1, rotation.z + 1);

            _TargetOBjTran.rotation = Quaternion.Euler(rotation);

        }

    }


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
