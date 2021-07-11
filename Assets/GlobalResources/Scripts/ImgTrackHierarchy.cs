using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class ImgTrackHierarchy : MonoBehaviour
{
    static string myLog = "";
    private string debugLog;

    bool isLoaded = false;

    public ARTrackedImageManager _ARTImgMng;

    //¹æ¹ý2
    private Dictionary<string, GameObject> _DicObject2 = new Dictionary<string, GameObject>();
    public List<GameObject> _TargetList2FromHierarchy;


    private void Awake()
    {
        Debug.Log("Awake");
        for (int i = 0; i < _TargetList2FromHierarchy.Count; i++)
        {
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

    private void OnEnable()
    {
        // register image tracking event 
        _ARTImgMng.trackedImagesChanged += ImageTracked;
        Debug.Log("ENABLED");
        debugLog = "ENABLED";
    }

    private void OnDisable()
    {
        // unload image tracking event 
        _ARTImgMng.trackedImagesChanged -= ImageTracked;
        Debug.Log("DISALBED");
        debugLog = "DISABLED";
    }

    void ImageTracked(ARTrackedImagesChangedEventArgs eventArgs)
    {

        foreach (ARTrackedImage artImg in eventArgs.added)
        {
            UpdateImg(artImg);
        }

        foreach (ARTrackedImage artImg in eventArgs.updated)
        {
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

    void UpdateImg(ARTrackedImage img)
    {

        /*
        // if Target Image triggered OBJ, show the OBJ
        else
        {
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
                }
                else
                {
                    debugLog = img.referenceImage.name;
                    // rotate x:90 degree because current marker is rotated in the scene
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x - 90, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    GameObject Obj = Instantiate(target, img.transform.position, rotation);
                    _DicObject.Add(img.referenceImage.name, Obj);
                }
            }
        }
        */
        
        // METHOD 2: deactivate all prefabs, only activate according Prefab
 
        // ONLY TRUE for current Tracked Image Prefab
        // NEED to Rotate x transform:-90 or 90 for Scene3Media, Scene4Play, Scene6Monster
        // STAY same for Scene2Book, Scene5Drink
        if (_DicObject2.ContainsKey(img.referenceImage.name)) {

            string currPrefabName = img.referenceImage.name;
           if (!_DicObject2[currPrefabName].activeSelf) {
                
                debugLog = currPrefabName;
                /*
                if (currPrefabName == "scene2Book")
                {
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    _DicObject2[currPrefabName].transform.position = img.transform.position;
                }
                */
                if ((currPrefabName == "scene3Media") || (currPrefabName == "scene4Play") || (currPrefabName == "scene6Monster"))
                {
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x - 90, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    _DicObject2[currPrefabName].transform.position = img.transform.position;
                    _DicObject2[currPrefabName].transform.rotation = rotation;

                }
                /*
                if (currPrefabName == "scene4Play")
                {
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x - 90, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    _DicObject2[currPrefabName].transform.position = img.transform.position;
                    _DicObject2[currPrefabName].transform.rotation = rotation;
                }
                
                if (currPrefabName == "scene5Drink")
                {
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    _DicObject2[currPrefabName].transform.position = img.transform.position;
                }
                
                if (currPrefabName == "scene6Monster")
                {
                    Quaternion rotation = Quaternion.Euler(new Vector3(img.transform.rotation.eulerAngles.x - 90, img.transform.rotation.eulerAngles.y, img.transform.rotation.eulerAngles.z));
                    _DicObject2[currPrefabName].transform.position = img.transform.position;
                    _DicObject2[currPrefabName].transform.rotation = rotation;
                }
                */

                _DicObject2[currPrefabName].SetActive(true);

                // _DicObject2[img.referenceImage.name].transform.position = img.transform.position;
                // _DicObject2[img.referenceImage.name].transform.rotation = img.transform.rotation;
            }
        } 
    }
}
