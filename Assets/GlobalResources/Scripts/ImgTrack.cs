using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class ImgTrack : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;

    bool isLoaded = false;

    public ARTrackedImageManager _ARTImgMng;

    //规过1
    private Dictionary<string, GameObject> _DicObject = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetListFromAssets;

    //规过2
    private Dictionary<string, GameObject> _DicObject2 = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetList2FromHierarchy;


    private void Awake()
    {
        Debug.Log("Awake");
        //规过2
        for (int i = 0; i < _TargetList2FromHierarchy.Count; i++) {
            _DicObject2.Add(_TargetList2FromHierarchy[i].name, _TargetList2FromHierarchy[i]);
        }
        Debug.Log(_ARTImgMng);
        //Debug.Log(_TargetList);
        //Debug.Log(_TargetList2);

        //StartCoroutine(co_LoadDelay());
    }

    //IEnumerator co_LoadDelay()
    //{
    //    yield return null;

    //    while(true)
    //    {
    //        _ARTImgMng.
    //    }
    //}

    private void OnEnable() {
        //image tracking event register
        _ARTImgMng.trackedImagesChanged += ImageTracked;
        Debug.Log("ENABLED");
        debugLog = "ENABLED";
    }

    private void OnDisable() {
        //image tracking event unload
        _ARTImgMng.trackedImagesChanged -= ImageTracked;
        Debug.Log("DISALBED");
        debugLog = "DISABLED";
    }
    
    void ImageTracked(ARTrackedImagesChangedEventArgs eventArgs) {

        foreach(ARTrackedImage artImg in eventArgs.added) {
            UpdateImg(artImg);
        }

        foreach (ARTrackedImage artImg in eventArgs.updated) {
            UpdateImg(artImg);
        }
    }

    public void ResetBtnClicked()
    {
        OnDisable();
    }

    void OnGUI()
    {
        myLog = GUI.TextArea(new Rect(500, 0, 100, 100), debugLog);
    }

    void UpdateImg(ARTrackedImage img) {
        //method 1: appear Prefab according to the image
        if (_DicObject.ContainsKey(img.referenceImage.name)) {

        }
        // if targeted Obj, show the object
        else {

            GameObject target = null;

            for (int i = 0; i < _TargetListFromAssets.Count; i++)
            {
                if (img.referenceImage.name == _TargetListFromAssets[i].name)
                {
                    target = _TargetListFromAssets[i];
                    break;
                }
            }
            if (target != null)
            {
                if (img.referenceImage.name == "scene2Book")
                {
                    debugLog = img.referenceImage.name;

                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    GameObject Obj = Instantiate(target, img.transform.position, rotation);
                    _DicObject.Add(img.referenceImage.name, Obj);
                } else
                {
                    debugLog = img.referenceImage.name;
                    // rotate x:90 degree because current marker is rotated in the scene
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x - 90, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    GameObject Obj = Instantiate(target, img.transform.position, rotation);
                    _DicObject.Add(img.referenceImage.name, Obj);
                }
                
            }
        }
        // remove method needed


        //// method 2: deactivate all prefabs, only activate according Prefab
        //if (_DicObject2.ContainsKey(img.referenceImage.name)) {

        //    if (!_DicObject2[img.referenceImage.name].activeSelf) {
        //        _DicObject2[img.referenceImage.name].SetActive(true);
        //        // _DicObject2[img.referenceImage.name].transform.position = img.transform.position;
        //        // _DicObject2[img.referenceImage.name].transform.rotation = img.transform.rotation;
        //    }
        //}
    }
}
