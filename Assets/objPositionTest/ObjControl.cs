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
        //컴포넌트가 실행될때 이미지트래킹 이벤트등록...
        if (_TrackImgMng != null)
            _TrackImgMng.trackedImagesChanged += ARTrackingImgChange;
    }

    private void OnDisable() {
        //컴포넌트가 종료될때 이미지트래킹 이벤트제거...
        if (_TrackImgMng != null)
            _TrackImgMng.trackedImagesChanged -= ARTrackingImgChange;
    }

    //테스트 버튼 만들기....
    private void OnGUI() {
        //버튼이 눌리면, y로 0.1(10cm)이동.
        if (GUI.Button(new Rect(10, 10, 100,50),"move")) {
            _TargetOBjTran.position = new Vector3(0f, _TargetOBjTran.position.y + 0.1f, 0f);
        }

        //버튼이 눌리면 지속적으로 회전을 시킨다.
        if (GUI.Button(new Rect(10, 70, 100, 50), "rotation")) {
            StartCoroutine(co_Rotation());
        }

        //오브젝트를 리셋....
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
